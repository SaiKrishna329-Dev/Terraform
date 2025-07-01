variable "ami_id" {
  description = "ubuntu ami for myfirstEC2"
  type = string
  default = "ami-020cba7c55df1f615"
}

# this is for aws_instance with more-than-2-instance_types

variable "instance_types" {
  type = list(string)
  default = [ "t2.micro", "t3.medium", "t3.small" ]
}

# this is for aws_instance with more-than-2-instance_names

variable "instances" {
  type = map(string)

  default = {
    web = "t2.micro"
    app = "t3.small"
    DB = "t3.medium"
  }
}

# variable for count with count.index

variable "instance_types" {
  default = ["t2.micro", "t3.small", "t3.medium"]
}

variable "key_pair" {
  type = string 
  default = "DevOps"  
}