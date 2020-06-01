terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

# The main code which creates each repository and attaches a IAM policy.

resource "aws_ecr_repository" "repository" {
  name  = "${element(var.ecr_repository_list, count.index)}"
  count = "${length(var.ecr_repository_list)}"
}

resource "aws_ecr_repository_policy" "repository_policy" {
  repository = "${element(aws_ecr_repository.repository.*.name, count.index)}"
  policy     = "${data.aws_iam_policy_document.repo_policy.json}"
  count      = "${length(var.ecr_repository_list)}"
}
