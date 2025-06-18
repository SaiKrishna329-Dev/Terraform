data "aws_instance" "example" {
  instance_id = "id of instance"
}

output "ec2_public_ip" {
  value = data.aws_instance.example.public_ip
}

# for multiple EC2 instances

#  data "aws_instances" "example" {
#   filter {
#     name   = "tag:Environment"
#     values = ["dev"]
#   }
# }

# output "instance_ids" {
#   value = data.aws_instances.example.ids
# } 