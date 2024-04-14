# Type of the instance
variable "type" {
  default     = "t3.micro"
  type        = string
  description = "Dev Instances Type"
}

# Variable to signal the current deployment environemnt as dev
variable "env" {
  default     = "dev"
  type        = string
  description = "Dev Environment"
}

# Denoting the minimum no of instances in ASG
variable "instance_count" {
  default     = "2"
  type        = string
  description = "Dev Instances Count"
}
