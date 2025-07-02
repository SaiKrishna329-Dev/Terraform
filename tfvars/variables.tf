variable "ami_id" {
  type = string
  default = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  type = map
  default = {
    web = "t2.micro"
    catalogue = "t2.micro"
    user = "t2.micro"
    mongodb = "t3.medium"
    }
}

variable "zone_id" {
  default = "Z09783732JPASCV91MKIZ"
}

variable "domain" {
  default = "learndevops.sbs"
}


variable "cidr_block" {
  default = "0.0.0.0/0"
}

