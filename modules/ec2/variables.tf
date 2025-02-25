variable "ami" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet1_id" {
  description = "Subnet 1 ID"
  type        = string
}

variable "subnet2_id" {
  description = "Subnet 2 ID"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}
