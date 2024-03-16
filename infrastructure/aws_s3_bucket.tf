resource "aws_s3_bucket" "media_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "media_bucket_public_access_block" {
  bucket = aws_s3_bucket.media_bucket.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "object_ownership" {
  bucket = aws_s3_bucket.media_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_iam_policy" "wordpress-s3-policy" {
  name        = "wordpress-s3-policy"
  description = "Allows access to S3 bucket for WordPress instances"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:*"
        ],
        Resource = [
          "${aws_s3_bucket.media_bucket.arn}",
          "${aws_s3_bucket.media_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_user" "wordpress-s3-user" {
  name = "wordpress-s3-user"
}

resource "aws_iam_access_key" "wordpress-s3-user-access-key" {
  user = aws_iam_user.wordpress-s3-user.name
}

resource "aws_iam_user_policy_attachment" "wordpress-s3-policy-attachment" {
  user       = aws_iam_user.wordpress-s3-user.name
  policy_arn = aws_iam_policy.wordpress-s3-policy.arn
}
