# In Terraform, the function cidrsubnet() is used to divide a large network (CIDR block) into smaller subnetworks automatically — so you don’t have to calculate subnet CIDRs manually.
# syntax : cidrsubnet(base_cidr, newbits, netnum) - base_cidr (VPC cidr), newbits(Number of extra bits to add to subnet mask (how many smaller subnets you want)), netnum(Which subnet number to use (starting at 0))
# how it works: cidrsubnet(var.vpc_cidr, 2, count.index) --> /16 + 2 --> /18 this is the subnet range within vpc cidr range.
# /16 to /18 --> it divides the ip range to 4 subnets which are ["10.0.0.0/18", "10.0.64.0/18", "10.0.128.0/18", "10.0.192.0/18"]
# if cidrsubnet(var.vpc_cidr, 3, count.index) --> /16 + 3 -- /19 means it divides the vpc range inti 8 subnets(19-16 = 3 --> 2^3 = 8 subnets)
# to use next set of sunbets :  cidr_block        = cidrsubnet(var.vpc_cidr, 3, count.index + 2)

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  count      = 4
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, 2, count.index)
  availability_zone = element(["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"], count.index)
}

