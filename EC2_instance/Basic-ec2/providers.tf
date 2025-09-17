# this file provides the details about the terraform provider like AWS,AZURE,k8s etc.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "terra-ec2-bucket"
    key = "ec2/demo"
    region = "us-east-1"
    dynamodb_table = "terra-ec2-locking"
  }
}



# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

