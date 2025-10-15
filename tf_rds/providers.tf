terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0.0"
    }
  }
  /* backend "s3" {
    bucket = "myfirsts3"
    key = "demo/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt = true
  } */
}

provider "aws" {
  region = "us-east-1"
}