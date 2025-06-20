output "instance_id" {
  value = aws_instance.ec2_module.id
}

output "public_ip" {
  value = aws_instance.ec2_module.public_ip
}