# file(path): Reads file content as a string.
# filebase64(path): Reads file and encodes it in base64.

# Use case: Load user-data scripts for EC2, or store secret files.

# Load a shell script as user-data
resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  user_data     = file("scripts/init.sh")
}

# Load a certificate file in base64
variable "cert_path" {
  default = "certs/cert.pem"
}

output "cert_base64" {
  value = filebase64(var.cert_path)
}
