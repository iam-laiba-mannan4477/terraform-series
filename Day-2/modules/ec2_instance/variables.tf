variable "ami_value" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type_value" {
  description = "The type of instance to use"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the instance will be created"
  type        = string
}

