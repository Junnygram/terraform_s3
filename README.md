## Step-by-Step Guide for Setting Up AWS CLI, Terraform, and Configuring an S3 Bucket

### Step 1: Install AWS CLI

Follow the instructions in the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) to install AWS CLI on your system.

### Step 2: Confirm AWS CLI Installation

```sh
which aws
```

### Step 3: Install Terraform

Follow the instructions in the [Terraform installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) to install Terraform on your system.

### Step 4: Confirm Terraform Installation

```sh
terraform -v
```

### Step 5: Download Project Template

Use `curl` or `wget` to download the project template:

```sh
curl -O https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
```

or

```sh
wget https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
```

Unzip the downloaded template:

```sh
unzip oxer.zip
```

### Step 6: Learn How to Use the AWS Provider in Terraform

Refer to the official documentation on [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#profile) to understand how to configure AWS in Terraform.

### Step 7: Create an IAM User and Access Key

1. Log in to the AWS Management Console.
2. Create a new IAM user with programmatic access.
3. Attach the necessary policies (e.g., `AmazonS3FullAccess`).
4. Generate and download the access key and secret key.

### Step 8: Configure AWS CLI with IAM User Credentials

Use the access key and secret key to configure the AWS CLI:

```sh
aws configure
```

Provide the access key ID, secret access key, region, and output format when prompted.

### Step 9: Initialize Terraform

Initialize the Terraform working directory:

```sh
terraform init
```

### Step 10: Build and Apply Changes

Apply the infrastructure changes:

```sh
terraform apply -auto-approve
```

### Step 11: Destroy Changes

Destroy the infrastructure changes:

```sh
terraform destroy -auto-approve
```

### Step 12: Configure S3 Bucket for Public Ownership

1. [S3 Bucket Ownership Controls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls)
2. [S3 Bucket Public Access Block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block)
3. [S3 Bucket ACL](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl)

If you have more items in the unzipped file, add them here in your Terraform configuration:

```hcl
resource "aws_s3_object" "item" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "itemName.js"           # Update with your JavaScript file name
  source       = "path/to/itemName.js"   # Update with the path to your JavaScript file
  acl          = "public-read"
  content_type = "application/javascript"
}
```

### Step 13: Configure S3 Bucket Website

Configure the S3 bucket for website hosting:
[S3 Bucket Website Configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration)

### Step 14: Confirm Changes in Your AWS Account

Log in to your AWS account and verify the changes made to the S3 bucket and other resources. You should see all objects there and create an output endpoint:

```hcl
output "website_endpoint" {
  value = aws_s3_bucket.mybucket.website_endpoint
}
```

You can now access your static app through this endpoint.
