# format() allows string interpolation using placeholders, like printf.

# Use case: Create resource names dynamically based on environment or region.

variable "env" {
  default = "prod"
}
variable "app" {
  default = "web"
}

output "server_name" {
  value = format("%s-%s-server", var.env, var.app)
}