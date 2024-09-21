# -Bucket-owner-enforced-and-Bucket-policy
# FrogTech S3 Bucket Deployment

This README outlines the deployment of a simple S3 bucket structure for FrogTech. The solution includes creating an S3 bucket with versioning enabled, setting ownership controls, creating an IAM user, and applying necessary permissions.

## Requirements

1. **S3 Bucket**:
   - Enable versioning.
   - Set bucket ownership to `BucketOwnerEnforced` to ensure that only the bucket owner has full access to the objects.
  
2. **IAM User**:
   - Create an IAM user named "Mohamed".
   - Provide access to upload files into the `/log` directory of the S3 bucket via a bucket policy.

3. **Destruction of S3 Bucket**:
   - Ensure that the S3 bucket can be destroyed using the `terraform destroy` command, even if it is not empty.

## Terraform Configuration

### Main Terraform Code

```hcl
provider "aws" {
  region = "us-east-1"  # Specify your desired region
}

# Create an S3 bucket with versioning enabled and ownership enforced
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  # Replace with a unique bucket name

  # Enable versioning
  versioning {
    enabled = true
  }

  # Set ownership to BucketOwnerEnforced
  ownership_controls {
    rules {
      object_ownership = "BucketOwnerEnforced"
    }
  }
}

# Create IAM user 'Mohamed'
resource "aws_iam_user" "mohamed" {
  name = "M
