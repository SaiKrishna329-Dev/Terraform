provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "value"
  type = string
  default = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  description = "value"
  type = map(string)

  default = {
    "Dev" = "t2.micro"
    "stage" = "t2.medium"
    "Prod" = "t2.xlarge"
  }
}

resource "aws_instance" "ec2_workspace" {
  ami = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}