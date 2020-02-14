#
# All the variables used by the various tf files.
#
variable "connect_production_domain_name" {
  description = "The main domain name for prod - e.g. connect.nationalleadership.gov.uk"
}

# variable "connect_staging_domain_name" {
#   description = "The staging domain name for prod - e.g. connect-staging.nationalleadership.gov.uk"
# }

variable "aws_region" {
  description = "The AWS region to create the domains in (e.g. eu-west-2)"
  type        = string
}

