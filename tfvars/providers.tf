terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "remote-robo"
    key = "demo"
    region = "us-east-1"
    dynamodb_table = "lock-robo"
  }
}

provider "aws" {
  region = "us-east-1"
}