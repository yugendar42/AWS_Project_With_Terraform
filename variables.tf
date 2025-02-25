variable "cidr" {
  default = "10.0.0.0/16"
}

variable "ami" {
  description = "AMI ID for EC2 instances"
  default     = "ami-0261755bbcb8c4a84"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "subnet1_cidr" {
  default = "10.0.0.0/24"
}

variable "subnet2_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "s3_bucket_name" {
  default = "Yugendar_s3_bucket"
}
