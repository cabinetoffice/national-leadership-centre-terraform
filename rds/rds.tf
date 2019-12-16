resource "aws_db_instance" "connect" {
  allocated_storage   = var.allocated_storage
  storage_type        = "gp2"
  engine              = "mysql"
  engine_version      = ""
  instance_class      = var.database_instance_type
  identifier          = "connect"
  username            = var.db_master_username
  password            = var.db_master_password
  publicly_accessible = false

  db_subnet_group_name      = var.database_subnet_group
  multi_az                  = var.multi_az
  backup_retention_period   = 7
}
