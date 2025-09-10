provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_value = "ami-0360c520857e3138f"
    instance_type_value = "t2.micro"
    subnet_id = "subnet-0674f306078791896"
}