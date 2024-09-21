# Create IAM users
resource "aws_iam_user" "mohamed" {
  name = "mohamed"
}

resource "aws_iam_user" "wael" {
  name = "wael"
}

# Create IAM Role for wael
resource "aws_iam_role" "wael_role" {
  name = "waelRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        "AWS" = "${aws_iam_user.wael.arn}"
      }
    }]
  })
}

# Create IAM Policy for wael to GetObject from logs directory
resource "aws_iam_policy" "wael_s3_policy" {
  name = "waelS3Policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = "s3:GetObject"
      Effect   = "Allow"
      Resource = "${aws_s3_bucket.my_bucket.arn}/logs/*"
    }]
  })
}

# Attach the access policy to the wael IAM role
resource "aws_iam_role_policy_attachment" "wael_policy_attach" {
  role       = aws_iam_role.wael_role.name
  policy_arn = aws_iam_policy.wael_s3_policy.arn
}

# Attach waelS3Policy directly to wael User
resource "aws_iam_user_policy_attachment" "wael_policy_attachment" {
  user       = aws_iam_user.wael.name
  policy_arn = aws_iam_policy.wael_s3_policy.arn
}

# Create IAM Policy for mohamed to PutObject
resource "aws_iam_policy" "mohamed_policy" {
  name        = "mohamedPolicy"
  description = "Policy for mohamed to put objects in the S3 bucket"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:PutObject"
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}

# Attach the mohamed Policy to mohamed User
resource "aws_iam_user_policy_attachment" "mohamed_policy_attachment" {
  user       = aws_iam_user.mohamed.name
  policy_arn = aws_iam_policy.mohamed_policy.arn
}