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
  default     = ["10.250.1.0/24", "10.250.2.0/24", "10.250.3.0/24"]
  type        = list(string)
  description = "Public Subnet CIDRs for PROD environment"
}

# Provisioning of Private Subnets in custom VPC
variable "private_subnet_cidrs" {
  default     = ["10.250.4.0/24", "10.250.5.0/24", "10.250.6.0/24"]
  type        = list(string)
  description = "Private Subnet CIDRs for PROD environment"
}

# Prod VPC cidr range
variable "vpc_cidr" {
  default     = "10.250.0.0/16"
  type        = string
  description = "Prod VPC to host the static website"
}

# Variable to signal the current environment 
variable "env" {
  default     = "prod"
  type        = string
  description = "Deployment Environment"
}
