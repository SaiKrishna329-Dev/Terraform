# Useful commands:

**1.terraform workspace list** - Displays all existing workspaces in the current Terraform configuration.

**2.terraform workspace new workspace_name** - Create a new workspace.

**3.terraform workspace select workspace_name** - Switch to a specific workspace.

**4.terraform workspace delete workspace_name** - Deletes the given workspace. You cannot delete the current active workspace.

**5.terraform workspace show** - Displays the name of the current active workspace.

**6.terraform init -reconfigure** - Re-initializes Terraform backend; useful if you're facing issues with workspace syncing.

**7.TF_LOG=DEBUG terraform workspace list** - Enable detailed logging for troubleshooting workspace issues.

**8.ls .terraform/environment** - Terraform tracks the current workspace in this file; inspecting it can help in debugging workspace confusion.

