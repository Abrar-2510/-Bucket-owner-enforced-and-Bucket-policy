
# Create an S3 bucket resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "byry-bucket"

  force_destroy       = true
  object_lock_enabled = false  #objects stored in this S3 bucket can be modified or deleted without any restrictions.

  tags = {
    Name        = "My bucket"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# add directory in s3 bucket
resource "aws_s3_object" "file1" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "log/mohamed.txt"   # This creates file1.txt in my-folder/

  source = "mohamed.txt"
  etag   = filemd5("mohamed.txt")
}

resource "aws_s3_object" "file2" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "log/wael.txt"   # This creates file2.txt in my-folder/

  source = "wael.txt"
  etag   = filemd5("wael.txt")
}

