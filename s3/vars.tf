#
# All the variables used by the various tf files.
#
variable "semver_bucket_name" {
  description = "The bucket for semver storage eg nlc-concourse-semver"
  type        = string
}

variable "s3fs_bucket_name" {
  description = "The bucket for s3fs storage for prod eg nlc-static-prod"
  type        = string
}

variable "s3fs_bucket_name_staging" {
  description = "The bucket for s3fs storage for staging eg nlc-static-staging"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy to (e.g. eu-west-2)"
  type        = string
}
