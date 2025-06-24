output "instnace_id" {
  value = aws_instance.myfirstEC2.id
}

output "public_ip" {
  value = aws_instance.myfirstEC2.public_ip
}