
# sets up an ES domain for the drupal site to use 

 resource "aws_security_group" "es_security_group" {
   name        = "es_security_group"
   description = "Allow VPC access from public subnets to es instance in private subnets"
   vpc_id      = var.vpc_id

   ingress {
     from_port   = 443
     to_port     = 443
     protocol    = "tcp"
     cidr_blocks = var.public_subnet_cidr_blocks
   }

   egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }
  tags =  { 
       terraform_managed = "true"
   }
 }


module "es" {
  source  = "git::https://github.com/terraform-community-modules/tf_aws_elasticsearch.git?ref=v1.2.0"

  domain_name                    = "es-connect"
  vpc_options                    = {
    security_group_ids = ["${aws_security_group.es_security_group.id}",]
    subnet_ids         = var.private_subnets
  }
  instance_count                 = var.es_instance_count
  instance_type                  = var.es_instance_type
  dedicated_master_threshold     = var.es_dedicated_master_threshold
  # defaults to same as instance_type
  dedicated_master_type          = var.es_dedicated_master_type
 
  es_zone_awareness              = true
  es_zone_awareness_count        = 3
  ebs_volume_size                = 10
  es_version                     = var.es_version
  use_prefix                     = false 
# sigh https://github.com/terraform-community-modules/tf_aws_elasticsearch/issues/42
create_iam_service_linked_role = "false"

  tags =  { 
       terraform_managed = "true"
   }

}

