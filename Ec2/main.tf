terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
  AWS_ACCESS_KEY_ID = var.Access_key
  AWS_SECRET_ACCESS_KEY = var.Secret_Access_key
 # shared_credentials_file = "$HOME/.aws/credentials"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b18ca1a93b538109"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
