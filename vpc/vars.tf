#
# All the variables used by the various tf files.
#
variable "vpc_name" {
  description = "what to call the VPC - e.g. eu-west-2-vpc-1"
}

variable "cluster_name" {
  description = "what we will call the EKS cluster "
}

variable "aws_region" {
  description = "The AWS region to deploy to (e.g. eu-west-2)"
  type        = string
}

