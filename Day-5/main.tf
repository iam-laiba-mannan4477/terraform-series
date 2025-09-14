provider "aws" {
  region = "us-east-1"
}

# AMI for all environments
variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

# Instance types per workspace
variable "instance_type" {
  description = "Instance types per workspace"
  type = map(string)
  default = {
    dev   = "t2.micro"
    stage = "t2.medium"
    prod  = "t2.large"
  }
}

# Subnet ID for all environments
variable "subnet_id" {
  description = "The subnet ID where the instance will be created"
  type        = string
}

# Use module to create EC2 instance
module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
  subnet_id     = var.subnet_id
}
