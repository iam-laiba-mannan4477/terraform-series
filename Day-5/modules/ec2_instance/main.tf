variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the EC2 instance in"
  type        = string
}

resource "aws_instance" "new-instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id  # Add this line
  tags = {
    Name = "My-new-EC2-Instance"
  }
}
