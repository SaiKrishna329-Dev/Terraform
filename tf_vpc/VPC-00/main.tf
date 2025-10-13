resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    name = "vpc"
    purpose = "practice"
  }
}

# PUBLIC SUBNETS
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.1.0.0/24"
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.1.3.0/24"
}


# resource "aws_subnet" "public1" {
#   vpc_id = aws_vpc.tf_vpc.id
#   cidr_block = "10.1.0.0/24"
#   #availability_zone_id = "us-east-1a"
# }

# resource "aws_subnet" "public2" {
#   vpc_id = aws_vpc.tf_vpc.id
#   cidr_block = "10.1.3.0/24"
#   #availability_zone_id = "us-east-1b"
# }

# PRIVATE SUBNETS
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.1.1.0/24"
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.1.2.0/24"
}

# resource "aws_subnet" "private1" {
#   vpc_id = aws_vpc.tf_vpc.id
#   cidr_block = "10.1.1.0/24"
#   #availability_zone_id = "us-east-1a"
# }

# resource "aws_subnet" "private2" {
#   vpc_id = aws_vpc.tf_vpc.id
#   cidr_block = "10.1.2.0/24"
#   #availability_zone_id = "us-east-1b"
# }

# INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tf_vpc.id
}

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.tf_vpc.id
# }

# PUBLIC ROUTE TABLE
resource "aws_route_table" "rtb_pub" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# resource "aws_route_table" "rtb_pub" {
#   vpc_id = aws_vpc.tf_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
# }

# PRIVATE ROUTE TABLE 1
resource "aws_route_table" "rtb_pri1" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }
}

# PRIVATE ROUTE TABLE 2
resource "aws_route_table" "rtb_pri2" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat2.id
  }
}


# resource "aws_route_table" "rtb_pri1" {
#   vpc_id = aws_vpc.tf_vpc.id

#   route {
#     cidr_block = "10.1.0.0/16"
#     nat_gateway_id = aws_nat_gateway.nat1.id
    
#   }
# }

# resource "aws_route_table" "rtb_pri2" {
#   vpc_id = aws_vpc.tf_vpc.id

#   route {
#     cidr_block = "10.1.0.0/16"
#     nat_gateway_id = aws_nat_gateway.nat2.id

#   }
# }

# EIP for NAT1
resource "aws_eip" "nat1" {
  domain = "vpc"
}

# EIP for NAT2
resource "aws_eip" "nat2" {
  domain = "vpc"
}

# resource "aws_eip" "nat" {
#   domain = "vpc"
# }

# NAT GATEWAY 1 (public1 subnet)
resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public1.id
}

# NAT GATEWAY 2 (public2 subnet)
resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public2.id
}

# resource "aws_nat_gateway" "nat1" {
#   allocation_id = aws_eip.nat.id
#   subnet_id = aws_subnet.public1.id
# }


# resource "aws_nat_gateway" "nat2" {
#   allocation_id = aws_eip.nat.id
#   subnet_id = aws_subnet.public2.id
# }

# ROUTE TABLE ASSOCIATION - PRIVATE SUBNETS
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.rtb_pri1.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.rtb_pri2.id
}

# resource "aws_route_table_association" "rta1" {
#   subnet_id = aws_subnet.private1.id
#   route_table_id = aws_route_table.rtb_pri1.id
# }

# resource "aws_route_table_association" "rta2" {
#   subnet_id = aws_subnet.private2.id
#   route_table_id = aws_route_table.rtb_pri2.id
# }

# ROUTE TABLE ASSOCIATION - PUBLIC SUBNET
resource "aws_route_table_association" "rta_pub" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.rtb_pub.id
}

# resource "aws_route_table_association" "rta_pub" {
#   subnet_id = aws_subnet.public1.id
#   route_table_id = aws_route_table.rtb_pub.id 
# }


