#
# All the variables used by the various tf files.
#
variable "vpc_name" {
  description = "which VPC - e.g. eu-west-2-vpc-1"
}

variable "vpc_id" {
  description = "VPC ID "
}

variable "aws_region" {
  description = "The AWS region to deploy to (e.g. eu-west-2)"
}


variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "database_subnets" {
  type = list(string)
}

variable "database_subnet_group" {
  type = string
}

variable "database_instance_type" {
  description = "What instance type to use for the db"
  type        = string
}

variable "allocated_storage" {
  description = "How many GB of storage to allocate"
  type        = number
}

variable "multi_az" {
  description = "Put the db in more than one AZ or not "
  type        = string
}

variable "db_instance_name" {
  description = "What to call the db "
  type        = string
}

variable "db_master_username" {
  description = "admin username for db"
  type        = string
}
variable "db_master_password" {
  description = "admin password for db"
  type        = string
}
