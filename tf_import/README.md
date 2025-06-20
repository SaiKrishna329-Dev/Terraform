1. write main.tf with import block with "id" and "to" path

2. terraform init --> terraform plan -generate-config-out=generated_resource.tf

3.  generated_resource.tf file will get create copy contents and delete generated file and import block in main.tf --> paste copied contents of generated file

4. Still terraform don't know about the manually created resource, if we plan then still it show 1 resource to add bcz of pasted main.tf eventhough instance is still running. Due to statefile is missing.

5. To create the statefile we run 

 - terraform import aws_instance.ec2_import id(i-0764ad3408ba082b7)

6. Statefile got created and now if we plan it showws nothingbto change. 