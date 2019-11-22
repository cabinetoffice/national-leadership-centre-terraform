terraform {
 backend "s3" {}
}

provider "aws" {
  region  = var.aws_region
}


# data "terraform_remote_state" "vpc" {
#   backend = "s3"
#   config = {
#     bucket = "subatomic-dev-gsp-state-2"
#     key = "vpc/terraform.tfstate"
#     region = "eu-west-2"
#   }
# }
