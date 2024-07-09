
# Define an S3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketName  # The name of the bucket is taken from the variable bucketName
}

# Set ownership controls for the bucket
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.id  # Referencing the ID of the bucket defined above

  rule {
    object_ownership = "BucketOwnerPreferred"  # Setting the ownership preference for objects in the bucket
  }
}

# Set public access block settings for the bucket
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id  # Referencing the ID of the bucket defined above

  block_public_acls       = false  # Allow public ACLs (Access Control Lists)
  block_public_policy     = false  # Allow public bucket policies
  ignore_public_acls      = false  # Do not ignore public ACLs
  restrict_public_buckets = false  # Do not restrict public bucket settings
}

# Set the ACL (Access Control List) for the bucket to public-read
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,  # Ensure ownership controls are applied first
    aws_s3_bucket_public_access_block.example,  # Ensure public access block settings are applied first
  ]

  bucket = aws_s3_bucket.mybucket.id  # Referencing the ID of the bucket defined above
  acl    = "public-read"  # Set the bucket ACL to public-read, allowing public read access
}

# Upload an HTML file to the bucket
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.id  # Referencing the ID of the bucket defined above
  key = "index.html"  # The name of the file in the bucket
  source = "index.html"  # The local path to the file being uploaded
  acl = "public-read"  # Set the ACL to public-read for this object
  content_type = "text/html"  # Specify the content type of the file
}

# Upload a CSS file to the bucket
resource "aws_s3_object" "css" {
  bucket = aws_s3_bucket.mybucket.id  # Referencing the ID of the bucket defined above
  key = "style.css"  # The name of the file in the bucket
  source =  "style.css"  # The local path to the file being uploaded
  acl = "public-read"  # Set the ACL to public-read for this object
  content_type = "text/css"  # Specify the content type of the file
}

# Upload a JavaScript file to the bucket
resource "aws_s3_object" "script" {
  bucket = aws_s3_bucket.mybucket.id  # Referencing the ID of the bucket defined above
  key = "script.js"  # The name of the file in the bucket
  source =  "script.js"  # The local path to the file being uploaded
  acl = "public-read"  # Set the ACL to public-read for this object
  content_type = "application/javascript"  # Specify the content type of the file, can also use "text/javascript"
}

# Configure the bucket to host a static website
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id  # Referencing the ID of the bucket defined above
  index_document {
    suffix = "index.html"  # The file to be served as the index document for the website
  }
  depends_on = [ aws_s3_bucket_acl.example ]  # Ensure ACL settings are applied first
}

