 # this will be used to return the number of elements in a list, map, string.
provider "aws" {
  region = "us-east-1"
}

 variable "subnets" {
   default = ["10.0.0.0/24", "10.1.0.0/16"]
 }
 
 output "subnets_ip" {
   value = length(var.subnets)
 }