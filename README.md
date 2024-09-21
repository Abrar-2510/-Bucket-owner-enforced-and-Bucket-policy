# FrogTech S3 Bucket Deployment

 ForgTech company wanna test your ability to type down a clean code by Deploying the structure of very simple resources. This will help you
 to build a good reputation.

## Requirements

1. **S3 Bucket**:
   - Enable versioning.
   - Set bucket ownership to `BucketOwnerEnforced` to ensure that only the bucket owner has full access to the objects.
  
2. **IAM User**:
   - Create an IAM user named "Mohamed".
   - Provide access to upload files into the `/log` directory of the S3 bucket via a bucket policy.

3. **Destruction of S3 Bucket**:
   - Ensure that the S3 bucket can be destroyed using the `terraform destroy` command, even if it is not empty.
