# Instance Type
variable "type" {
  default     = "t3.small"
  type        = string
  description = "Staging Instances Type"
}

# Variable to signal the current environment 
variable "env" {
  default     = "staging"
  type        = string
  description = "Staging Environment"
}

# Number of Instances in AutoScalingGroup
variable "instance_count" {
  default     = "3"
  type        = string
  description = "staging Instances Count"
}