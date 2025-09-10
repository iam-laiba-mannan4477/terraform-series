provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "name" {
    ami           = "ami-0360c520857e3138f"
    instance_type = "t2.micro"
    subnet_id     = "subnet-0674f306078791896"
    key_name      = "keypair"
    
     associate_public_ip_address = true
  
}
resource "aws_s3_bucket" "name" {
    bucket = "mybucket4567-xyz"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}