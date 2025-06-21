provider "aws" {
  region = "us-east-1"
}

# import {
#   id = vpc-0d50e2a3dee39d9b0
#   to = aws_vpc.vpc_import
# }

resource "aws_vpc" "vpc_import" {
 # cidr_block = "10.0.0.0/16"

tags = {
  Name = "project-vpc"
}

tags_all = {
  Name = "project-vpc"
}

}

