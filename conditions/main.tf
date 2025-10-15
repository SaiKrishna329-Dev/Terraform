# how to use count and count.index

/*variable "environments" {
  default = ["dev", "staging", "prod"]
}

resource "aws_instance" "servers" {
  count = length(var.environments)
  ami   = "ami-0360c520857e3138f"

  instance_type = var.environments[count.index] == "prod" ? "t3.large" : "t3.micro"

    tags = {
    Name = "server-${var.environments[count.index]}"
  } 
}*/

variable "environments" {
  type = map(string)
  
  default = {
    "dev" = "t2.micro"
    "prod" = "t3.medium"
  }
}
variable "ami" {
  default = "ami-0360c520857e3138f"
}

resource "aws_instance" "for_each" {
    for_each = var.environments
    ami = var.ami
    instance_type = each.key == "prod" ? each.value : "t2.micro"

    tags = {
      Name = "server-${each.key}"
    }
}