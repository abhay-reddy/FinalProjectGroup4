# Instance Type
variable "type" {
  default     = "t3.medium"
  type        = string
  description = "Prod Instances Type"
}

# Variable to signal the current deployment environment 
variable "env" {
  default     = "prod"
  type        = string
  description = "PROD Environment"
}

# Number of Instances in AutoScalingGroup
variable "instance_count" {
  default     = "2"
  type        = string
  description = "PROD Instances Count"
}