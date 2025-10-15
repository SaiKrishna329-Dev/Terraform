# toset(list) -- Converts the list in set and removes the duplicates
# tolist(set) -- Converts the set to list
# use case : To maintain uniqueness in security groups and tags.

/*
| Feature              | `list`        | `set`                  |
| -------------------- | ------------- | ---------------------- |
| Order                | Preserved     | Not preserved          |
| Duplicates           | Allowed       | Not allowed            |
| Index access (`[0]`) | ✅ Yes         | ❌ No                   |
| Use case             | Ordered data  | Unique, unordered data |
| Conversion           | `toset(list)` | `tolist(set)`          |
*/

variable "ips" {
  default = ["10.0.0.0/24", "10.1.0.0/16", "10.1.0.0/16"]
}

output "sub_set" {
  value = toset(var.ips)
}

output "sub_list" {
  value = tolist(toset(var.ips))
}