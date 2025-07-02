resource "aws_instance" "ec2_tfvars" {
    for_each = var.instance_type
    ami = var.ami_id
    instance_type = each.value

    tags = {
      Name = each.key
    }    
}

resource "aws_route53_record" "myroute_53" {
    for_each = aws_instance.ec2_tfvars   #getting the all ec2 info for route53
    zone_id = var.zone_id
    name    = "${each.key}.${var.domain}"
    type    = "A"
    ttl     = 1
    records = [ each.key == "web" ? each.value.public_ip : each.value.private_ip ]
}

resource "aws_security_group" "tfvars_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "tfvars_sg_ipv4" {
  security_group_id = aws_security_group.tfvars_sg.id
  cidr_ipv4         = var.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "tfvars_sg_ipv4" {
  security_group_id = aws_security_group.tfvars_sg.id
  cidr_ipv4         = var.cidr_block
  ip_protocol       = "-1" # semantically equivalent to all ports
}
