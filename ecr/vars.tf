variable "ecr_repository_list" {
  description = "List of all the repositories we manage"
  type        = "list"
}
variable "ecr_account_list" {
  description = "List of all the accounts to grant access to"
  type        = "list"
}
variable "aws_region" {
  description = "Region we are using "
  type        = "string"
}
