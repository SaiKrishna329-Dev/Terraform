variable "ami" {
  description = "this ami is for ec2 instance"
}

variable "instance_type" {
  description = "value"
}

variable "key_name" {
  description = "DevOps"
  default = "DevOps"
}

resource "aws_instance" "ec2_module" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
}