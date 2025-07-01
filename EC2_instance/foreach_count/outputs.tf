output "instance_id" {
  value = [for instance in aws_instance.more-than-2-instance_with_names : instance.id]
}

output "instance_id" {
  value = [for instance in aws_instance.count_and_count_index : instance.id]
}