resource "aws_instance" "myfirstEC2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_pair
    security_groups = var.sg 
}
