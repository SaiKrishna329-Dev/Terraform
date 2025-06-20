provider "aws" {
  region = "us-east-1"
}

variable "ami_id" {
  default = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  default = "t2.micro"
}

resource "aws_instance" "myfirstEC2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_pair
}