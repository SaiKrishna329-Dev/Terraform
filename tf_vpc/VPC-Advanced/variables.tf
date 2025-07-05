variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "common_tags" {
  type = map(string)
  default = {
    "environment" = "prod"
    "terraform" = "true"
  }
}

variable "project_name" {
  default = "tivo"
}

variable "igw" {
  default = "igw"
}

# variable "azs" {
#   default = ["us-east-1a", "us-east-1b"]
# }

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}