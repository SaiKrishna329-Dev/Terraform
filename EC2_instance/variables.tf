variable "ami_id" {
  description = "ubuntu ami for myfirstEC2"
  type = string
  default = "value"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_pair" {
  type = string 
  default = "dev"  
}

variable "sg" {
  type = list(string)
  default = ["name of sg"]
}
