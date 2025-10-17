# join - Combines a list of strings into a single string -- join(seperator, list)
# split - Splits a string into a list of strings -- split(seperator, string)
# slice(list, start_index, end_index)


variable "list" {
  default = ["dev1", "dev2", "dev3"]
}

output "server_string" {
  value = join(",", var.list)
}

output "server_list" {
  value = split(",", "dev1, dev2, dev3")
}