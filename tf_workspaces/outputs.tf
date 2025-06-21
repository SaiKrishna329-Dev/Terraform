output "instance_id" {
  value = aws_instance.ec2_workspace.id
}

output "public_ip" {
  value = aws_instance.ec2_workspace.public_ip
}