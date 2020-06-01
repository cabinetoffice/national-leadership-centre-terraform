#
# Request ACM certs
#

#resource "aws_acm_certificate" "connect_staging_certificate" {
#  domain_name       = var.connect_staging_domain_name
#  validation_method = "DNS"
#
#  tags = {
#    terraform = "true"
#  }
#
#  lifecycle {
#    create_before_destroy = true
#  }
#}

resource "aws_acm_certificate" "connect_production_certificate" {
  domain_name       = var.connect_production_domain_name
  validation_method = "DNS"

  tags = {
    terraform = "true"
  }

  lifecycle {
    create_before_destroy = true
  }
}
