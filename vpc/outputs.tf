# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "database_subnet_group" {
  description = "ID of database subnet group"
  value       = module.vpc.database_subnet_group
}

output "database_subnet_cidr_blocks" {
  description = "Database subnet blocks"
  value       = module.vpc.database_subnets_cidr_blocks
}

output "private_subnet_cidr_blocks" {
  description = "Private subnet blocks"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_subnet_cidr_blocks" {
  description = "Public subnet blocks"
  value       = module.vpc.public_subnets_cidr_blocks
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

# Vault key
output "vault_auto_unseal_key_id" {
  description = "Key ID for auto unseal KMS key"
  value       = "${aws_kms_key.vault-auto-unseal-key.key_id}"
}
output "vault_auto_unseal_key_arn" {
  description = "ARN for auto unseal KMS key"
  value       = "${aws_kms_key.vault-auto-unseal-key.arn}"
}
