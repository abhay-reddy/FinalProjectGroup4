# Default tags of resources
variable "default_tags" {
  default = {
    "Owner" = "Group4"
    "App"   = "Web App"
  }
  type        = map(any)
  description = "Default tags to be appliad to all AWS resources"
}

# Name prefix
variable "prefix" {
  default     = "Group4"
  type        = string
  description = "Name Prefix"
}

# Provisioning of Public Subnets in custom VPC
variable "public_subnet_cidrs" {
  default     = ["10.200.1.0/24", "10.200.2.0/24", "10.200.3.0/24"]
  type        = list(string)
  description = "Public Subnet CIDRs for Staging environment""
}

# Provisioning of Private Subnets in custom VPC
variable "private_subnet_cidrs" {
  default     = ["10.200.4.0/24", "10.200.5.0/24", "10.200.6.0/24"]
  type        = list(string)
  description = "Private Subnet CIDRs for Staging  environment"
}

# staging VPC cidr range
variable "vpc_cidr" {
  default     = "10.200.0.0/16"
  type        = string
  description = "Staging environment VPC to host the static website"
}

# Variable to signal the current deployment environment 
variable "env" {
  default     = "staging"
  type        = string
  description = "Deployment Environment"
}
