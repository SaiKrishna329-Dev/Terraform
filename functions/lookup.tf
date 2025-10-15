# syntax: lookup(map, key, default) -- it retrives a value from map, if doesn't exist it will returns a default value.

variable "stats" {
  default = {
    cpu = 2
    disk = 90
    memory = 8
  }
}

output "disk_size" {
  #value = lookup(var.stats, "disk", 33)
   value = lookup(var.stats, "config", 33)

}