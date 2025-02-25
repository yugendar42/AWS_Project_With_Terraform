variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet1_cidr" {
  description = "CIDR block for subnet 1"
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block for subnet 2"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}
