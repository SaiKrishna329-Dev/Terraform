1. write main.tf with import block with "id" and "to" path

        terraform init --> terraform plan -generate-config-out=generated_resource.tf

2.  generated_resource.tf file will get create copy contents and delete generated file and import block in main.tf --> paste copied contents of generated file

3. Still terraform don't know about the manually created resource, if we plan then still it show 1 resource to add bcz of pasted main.tf eventhough instance is still running. Due to statefile is missing.

4. To create the statefile we run 

        terraform import aws_instance.ec2_import id(i-0764ad3408ba082b7)

5. Statefile got created and now if we plan it shows nothing to change. 

**NOTE:** without creating generate output file also we can update the statefile directly, but only change is out main.tf should have the resource block even without contents also it will work. ex: vpc_import

