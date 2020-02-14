
# ACM

output "connect_production_certificate_arn" {
  description = "The ARN of the production domain certificate"
  value       = "${aws_acm_certificate.connect_production_certificate.arn}"
}

output "connect_production_certificate_domain_name" {
  description = "The domain name of the production domain certificate"
  value       = "${aws_acm_certificate.connect_production_certificate.domain_name}"
}

output "connect_production_certificate_domain_validation_options" {
  description = "The validation info of the production domain certificate"
  value       = "${aws_acm_certificate.connect_production_certificate.domain_validation_options}"
}

# 
# output "connect_staging_certificate_arn" {
#   description = "The ARN of the staging domain certificate"
#   value       = "${aws_acm_certificate.connect_staging_certificate.arn}"
# }
# 
# output "connect_staging_certificate_domain_name" {
#   description = "The domain name of the staging domain certificate"
#   value       = "${aws_acm_certificate.connect_staging_certificate.domain_name}"
# }
# 
# output "connect_staging_certificate_domain_validation_options" {
#   description = "The validation info of the staging domain certificate"
#   value       = "${aws_acm_certificate.connect_staging_certificate.domain_validation_options}"
# }
# 
# 
# 
