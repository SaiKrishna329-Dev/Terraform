# resource with for_each and map

resource "aws_instance" "more-than-2-instance_types" {
  for_each = toset(var.instance_types)
  
  ami = var.ami_id
  instance_type = each.value
  key_name = var.key_pair

  tags = {
    name = "EC2-${each.value}"
  }
}

resource "aws_instance" "more-than-2-instance_with_names" {
  for_each = var.instances
    
  ami = var.ami_id
  instance_type = each.value
  key_name = var.key_pair

  tags = {
    name = "EC2-${each.key}"
  }
}


# resource with count and count.index

resource "aws_instance" "count_and_count_index" {
  count = length(var.instance_types)
  ami = var.ami_id
  instance_type = var.instance_types[count.index]
  key_name = var.key_pair

  tags = {
    Name = "ec2-${var.instance_types[count.index]}"
  }
}


#Use "for_each" when you want to work with keys or names (map, set).

#Use "count" when dealing with simple lists.

