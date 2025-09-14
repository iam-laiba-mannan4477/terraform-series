provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address          = "http://3.89.86.161:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = "2bb20fb1-12e4-6b3f-5d6e-f64942430e63"
      secret_id = "a53f2ba6-2442-f9a4-4a72-cee3d8b76ddc"
    }
  }
}

# 👇 use data if you want to fetch an existing secret
data "vault_kv_secret_v2" "example_ephemeral" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "example_ephemeral" {
  ami           = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0674f306078791896"
  tags = {
    secret = data.vault_kv_secret_v2.example_ephemeral.data["username"]
  }
}
