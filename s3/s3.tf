resource "aws_s3_bucket" "semver_bucket" {
  bucket = var.semver_bucket_name

  tags = {
    terraform_managed = "true"
  }
}

resource "aws_s3_bucket" "s3fs_bucket" {
  bucket = var.s3fs_bucket_name

  tags = {
    terraform_managed = "true"
  }
}

resource "aws_s3_bucket" "s3fs_bucket_staging" {
  bucket = var.s3fs_bucket_name_staging

  tags = {
    terraform_managed = "true"
  }
}
