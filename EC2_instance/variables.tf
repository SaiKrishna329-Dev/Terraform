variable "ami_id" {
  description = "ubuntu ami for myfirstEC2"
  type = string
  default = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_pair" {
  type = string 
  default = "DevOps"  
}

variable "sg" {
  type = list(string)
  default = ["name of sg"]
}
