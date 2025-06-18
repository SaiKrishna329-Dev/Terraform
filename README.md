# Terraform

Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. It allows you to define, provision, and manage cloud and on-prem infrastructure using a simple, declarative configuration language called HCL (HashiCorp Configuration Language).

# Key Concepts

**Infrastructure as Code (IaC)**

 - Define infrastructure (servers, databases, networks, etc.) in configuration files.

 - Enables version control, automation, and repeatability.

**Declarative Syntax**

 - You declare what infrastructure you want, not how to build it.

**Providers**

 - Plugins that interact with APIs of platforms like AWS, Azure, GCP, Kubernetes, etc.

**Example**: provider "aws" tells Terraform to use AWS.

**Resources**

 - Basic building blocks like aws_instance, google_storage_bucket, etc.

 - You define what you want created, and Terraform handles the rest.

**State File (terraform.tfstate)**

 - Keeps track of the real-world infrastructure and maps it to your code.

 - Crucial for operations like updates and deletions.

**Modules**

 - Reusable groups of resources.

 - Help in organizing and abstracting code.

# Basic Workflow
 - Write configuration in .tf files.

 - Initialize with terraform init to download providers and set up the working directory.

 - Plan changes using terraform plan.

 - Apply with terraform apply to provision or modify infrastructure.

 - Destroy with terraform destroy to tear down resources.

# Benefits

 - Platform agnostic – Works across many cloud providers.

 - Automated and repeatable – Ideal for CI/CD pipelines.

 - Readable and modular – Great for teams and scaling.

**CodeSpaces:**

  1. >add dev conatainer configuaration --> modify active config --> terraform,tfliht verified --> kep defaults --> devconatiner.json

  2. >add dev conatainer configuaration --> modify active config --> aws cli --> kep defaults --> devconatiner.json

  3. >rebuild container 