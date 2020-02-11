
# sets up an RDS instance for the drupal site to use 

resource "aws_security_group" "db_security_group" {
  name        = "db_security_group"
  description = "Allow VPC access from public subnets to rds instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.public_subnet_cidr_blocks
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

#resource "aws_db_parameter_group" "with-log-bin-trust" {
#  name   = "with-log-bin-trust"
#  description = "for mysql log_bin_trust_function_creators" 
#  family = "mysql5.7"
#
#  parameter {
#    name  = "log_bin_trust_function_creators"
#    value = "1"
#  }
#
#   tags = {
#      "terraform_managed"  = "true"
#   }
#
#}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = var.database_identifier

  instance_class    = var.database_instance_class
  allocated_storage = var.allocated_storage
  multi_az                  = var.multi_az
  backup_retention_period   = 28

  # create initial db
  name                = var.database_name
  username            = var.db_master_username
  password            = var.db_master_password
  port                = "3306"
  publicly_accessible = false

  iam_database_authentication_enabled = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  vpc_security_group_ids = ["${aws_security_group.db_security_group.id}",]


  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  # monitoring_interval = "30"
  # monitoring_role_name = "MyRDSMonitoringRole"
  # create_monitoring_role = true

  # DB subnet group
  subnet_ids = var.database_subnets

  # DB parameter group
  family = "mysql5.7"

  engine            = "mysql"
  major_engine_version = var.major_engine_version
  engine_version = var.engine_version


  # Snapshot name upon DB deletion
  final_snapshot_identifier = "connect-prod"

  # Database Deletion Protection
  deletion_protection = true

   tags = {
      "terraform_managed"  = "true"
   }

  # DB option group
  parameters = [
    {
      name = "character_set_client"
      value = "utf8"
    },
    {
      name = "character_set_server"
      value = "utf8"
    },
    {
      name  = "log_bin_trust_function_creators"
      value = "1"
    }
  ]
}


