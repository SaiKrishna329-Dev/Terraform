resource "aws_vpc" "xperi" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}"
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.xperi.id

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.igw}"
    }
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.xperi.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = local.azs[count.index]
 

 tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-public-${local.azs[count.index]}"
    }
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr)
  vpc_id     = aws_vpc.xperi.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = local.azs[count.index]
 

 tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-private-${local.azs[count.index]}"
    }
  )
}

resource "aws_eip" "eip" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public[0].id

 tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-nat_gw"
    }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.xperi.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

 tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-rt-public"
    }
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.xperi.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

 tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-rt-private"
    }
  )
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)  
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr)  
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id
}