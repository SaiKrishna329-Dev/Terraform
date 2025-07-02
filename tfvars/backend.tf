# if we want to restore the backend state then we need to create separete backend.tf file and try to reconfigure it
# terraform init -reconfigure -backend-config=PROD/backend.tf or backend.tf
terraform {
    backend "s3" {
    bucket = "remote-robo"
    key = "demo"
    region = "us-east-1"
    dynamodb_table = "lock-robo"
  }
}