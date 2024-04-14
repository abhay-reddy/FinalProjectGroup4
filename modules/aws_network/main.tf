# - Defining the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Data Source for Availability Zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}

# Local variables
locals {
  default_tags = merge(
    var.default_tags,
    { "Env" = var.env }
  )
  name_prefix = "${var.prefix}-${var.env}"
}

# Create a new VPC 
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = merge(
    local.default_tags, {
      Name = "${local.name_prefix}-VPC"
    }
  )
}

# Adding Public Subnets
resource "aws_subnet" "public_subnet" {
  count             = length (var.public_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index+1]
  tags = merge(
    local.default_tags, {
      Name = "${local.name_prefix}-PublicSubnet${count.index+1}"
    }
  )
}

# Adding Private Subnets
resource "aws_subnet" "private_subnet" {
  count             = length (var.private_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index+1]
  tags = merge(
    local.default_tags, {
      Name = "${local.name_prefix}-PrivateSubnet${count.index+1}"
    }
  )
}

# Creating an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(local.default_tags,
    {
      "Name" = "${local.name_prefix}-IGW"
    }
  )
}

# Defining route Table and adding internet gateway route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${local.name_prefix}-RouteTable_IGW"
  }
}

# Createing a NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id = aws_subnet.public_subnet[0].id

  tags = {
    Name = "${local.name_prefix}-NAT_GW"
  }
}

# Create elastic IP for NAT GW
resource "aws_eip" "nat-eip" {
  domain = "vpc"
  tags = merge(local.default_tags,
    {
      "Name" = "${local.name_prefix}-EIP"
    }
  )
}

# PrCreating Pivate Route Table and adding NGW
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "${local.name_prefix}-RouteTable_NAT"
  }
}

# Associate subnets with the custom route table
resource "aws_route_table_association" "public_route_table_association" {
  count          = length (var.public_cidr_blocks)
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet[count.index].id
}

resource "aws_route_table_association" "private_route_table_association" {
  count          = length (var.private_cidr_blocks)
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet[count.index].id
}
