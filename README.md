## Step-by-Step Guide for Setting Up AWS CLI, Terraform, and Configuring an S3 Bucket

### Step 1: Install AWS CLI

Follow the instructions in the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) to install AWS CLI on your system.

### Step 2: Confirm AWS CLI Installation

Open your terminal or command prompt and run the following command:

```sh
which aws
```

If installed correctly, this should return the path to the AWS CLI executable.

### Step 3: Install Terraform

Follow the instructions in the [Terraform installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) to install Terraform on your system.

### Step 4: Confirm Terraform Installation

Run the following command to ensure Terraform is installed properly:

```sh
terraform -v
```

This should display the installed Terraform version.

### Step 5: Download Project Template

Use `curl` or `wget` to download a sample project template:

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

Refer to the official [AWS Provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#profile) to understand how to configure AWS in Terraform.

### Step 7: Create an IAM User and Access Key

1. Log in to the AWS Management Console.
2. Navigate to the IAM service.
3. Create a new IAM user with programmatic access.
4. Attach the necessary policies (e.g., `AmazonS3FullAccess`).
5. Generate and download the access key and secret key.

### Step 8: Configure AWS CLI with IAM User Credentials

Use the access key and secret key to configure the AWS CLI:

```sh
aws configure
```

You will be prompted to enter the following information:

- AWS Access Key ID
- AWS Secret Access Key
- Default region name (e.g., us-east-1)
- Default output format (e.g., json)

### Step 9: Initialize Terraform

Navigate to your Terraform project directory and initialize the Terraform working directory:

```sh
terraform init
```

### Step 10: Create Terraform Configuration File

Create a Terraform configuration file (`main.tf`) with the following content to set up an S3 bucket:

```hcl
provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "my-unique-bucket-name"  # Change to a unique bucket name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
```

### Step 11: Apply Terraform Configuration

Build and apply the Terraform configuration:

```sh
terraform apply -auto-approve
```

### Step 12: Configure S3 Bucket for Public Ownership

Add the following resources to your `main.tf` to configure S3 bucket ownership and public access:

```hcl
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.bucket

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.bucket

  block_public_acls   = false
  block_public_policy = false
  ignore_public_acls  = false
  restrict_public_buckets = false
}
```

### Step 13: Upload Files to S3 Bucket

If you have more files in the unzipped template, add them to your Terraform configuration:

```hcl
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.bucket
  key    = "index.html"
  source = "path/to/index.html"
  acl    = "public-read"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.mybucket.bucket
  key    = "error.html"
  source = "path/to/error.html"
  acl    = "public-read"
}
```

### Step 14: Configure S3 Bucket Website

Configure the S3 bucket for website hosting:

```hcl
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
```

### Step 15: Apply Terraform Changes

Apply the changes to set up the S3 bucket and upload files:

```sh
terraform apply -auto-approve
```

### Step 16: Output the Website Endpoint

Add the following output to your `main.tf` to display the website endpoint:

```hcl
output "website_endpoint" {
  value = aws_s3_bucket.mybucket.website_endpoint
}
```

### Step 17: Confirm Changes in Your AWS Account

Log in to your AWS account and verify the changes made to the S3 bucket. You should see the objects and the configured website.

### Step 18: Access Your Static Website

Go to your S3 bucket, click on "Properties," and scroll down to the "Static website hosting" section. Click on the provided link to access your static website.
