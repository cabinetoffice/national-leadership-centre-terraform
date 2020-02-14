#
# All the variables used by the various tf files.
#
#variable "vpc_name" {
#  description = "which VPC - e.g. eu-west-2-vpc-1"
#}

variable "vpc_id" {
  description = "VPC ID "
}

variable "aws_region" {
  description = "The AWS region to deploy to (e.g. eu-west-2)"
}

variable "private_subnet_cidr_blocks" {
  type = list(string)
}

variable "public_subnet_cidr_blocks" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}


variable "es_domain_name" {
  type = string
}


variable "es_instance_type" {
  type = string
}

variable "es_instance_count" {
  type = number
}

variable "es_dedicated_master_type" {
  type = string
}

variable "es_dedicated_master_threshold" {
  type = number
}

