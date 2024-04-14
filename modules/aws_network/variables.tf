# Default Tags
variable "default_tags" {
  default = {
    "Owner" = "Group4"
    "App"   = "Web App"
  }
  type        = map(any)
  description = "Default tags to be applied to all AWS resources"
}

# Name Prefix
variable "prefix" {
  default     = "Group4Project"
  type        = string
  description = "Name Prefix"
}

# Provision public subnets in custom VPC
variable "public_subnet_cidrs" {
  default     = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
  type        = list(string)
  description = "Public Subnet CIDRs"
}

# Provision public subnets in custom VPC
variable "private_subnet_cidrs" {
  default     = ["10.100.4.0/24", "10.100.5.0/24", "10.100.6.0/24"]
  type        = list(string)
  description = "Private Subnet CIDRs"
}

# VPC CIDR Range
variable "vpc_cidr" {
  default     = "10.100.0.0/16"
  type        = string
  description = "DEV VPC to host static web site"
}

# Variable to signal the current environment 
variable "env" {
  default     = "dev"
  type        = string
  description = "Deployment Environment"
}

# Number of Instances in AutoScalingGroup
variable "instance_count" {
  default     = "2"
  type        = string
  description = "Instances Count for auto scaling"
}

# ASG Instance Type
variable "type" {
  default     = "t3.micro"
  type        = string
  description = "Instance Type"
}

