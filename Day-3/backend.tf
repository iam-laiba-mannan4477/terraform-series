terraform {
  backend "s3" {
    bucket = "mybucket4567-xyz"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_locks"
  }
}
