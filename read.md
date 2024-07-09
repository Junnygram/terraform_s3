# Step 1: Install AWS CLI

# Follow the instructions at the link below to install AWS CLI:

# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

# Step 2: Confirm AWS CLI installation

which aws

# Step 3: Install Terraform

# Follow the instructions at the link below to install Terraform:

# https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

# Step 4: Confirm Terraform installation

terraform -v

# Step 5: Learn how to use the AWS provider in Terraform

# Refer to the official documentation at:

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#profile

# Step 6: Initialize Terraform

terraform init

# TERRFORM PLAN

# Step 7: Build and apply changes

terraform apply -auto-approve

# Step 8: Build and destroy changes

terraform destroy -auto-approve

Make sure to follow the installation guides and documentation provided in the links for detailed instructions on setting up AWS CLI and Terraform. The `terraform init` command initializes the Terraform working directory, and the terraform apply and `terraform destroy` commands apply and destroy the infrastructure changes respectively.

# Step 8: public ownership so we can make changes to the bucket

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls

# Step 9: public ownership so we can make changes to the bucket

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block

# Step 10: Make Acl public

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl
