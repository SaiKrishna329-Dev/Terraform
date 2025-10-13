terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0.0"
    }
  }
  backend "s3" {
    bucket = "sai-s3-tf"
    key = "demo/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_first_s3" {
  bucket = "sai-s3-tf"
  
   tags = {
     env = "prod"
   }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_instance" "myfirstEC2" {
  ami = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
}