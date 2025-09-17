provider "aws" {
  region = "us-east-1"
}

provider "vault" {
    auth_login {
    path = "auth/approle/login"

    parameters = { 
      role_id   = "login_approle_role_id"  # should be taken from the cli of vault server
      secret_id = "login_approle_secret_id"
    }
  }
}

resource "vault_mount" "kvv2" {
  path        = "kvv2"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "example" {
  mount               = vault_mount.kvv2.path
  name                = "secret"
  delete_all_versions = true
  data_json = jsonencode(
    {
      zip = "zap",
      foo = "bar"
    }
  )
}

data "vault_kv_secret_v2" "example" {
  mount = vault_mount.kvv2.path
  name  = vault_kv_secret_v2.example.name
}

resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["foo"]
  }
}