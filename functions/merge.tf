
# to combine multiple maps into single map, if any overlap exists last map will win.

variable "default_tags" {
  default = {
    coures = "DevOps"
    Tool = "terraform"
  }
}

variable "env_tags" {
  default = {
    prod = true
    staging = false
  }
}

output "combined_tags" {
  value = merge(var.default_tags, var.env_tags)
}

