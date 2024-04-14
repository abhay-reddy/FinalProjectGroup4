# Default tags
variable "default_tags" {
  default = {
    "Owner" = "Group4"
    "App"   = "Web App"
  }
  type        = map(any)
  description = "Default tags to be applied to all AWS resources"
}

# Name prefix
variable "prefix" {
  type        = string
  default     = "Group4Project"
  description = "Name Prefix"
}

# Provisioning of Public Subnets in custom VPC
variable "public_subnet_cidrs" {
  default     = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
  type        = list(string)
  description = "Public Subnet CIDRs for Dev environment"
}

# Provisioning of Private Subnets in custom VPC
variable "private_subnet_cidrs" {
  default     = ["10.100.4.0/24", "10.100.5.0/24", "10.100.6.0/24"]
  type        = list(string)
  description = "Private Subnet CIDRs for Dev environment"
}

# Dev vpc cidr range
variable "vpc_cidr" {
  default     = "10.100.0.0/16"
  type        = string
  description = "vpc for dev"
}

# to signal the current deployment environment
variable "env" {
  default     = "Dev"
  type        = string
  description = "dev environment"
}
