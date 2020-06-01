#
# Uses the module from registry.terraform.io to build a VPC
#
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> v2.0"

  name = "${var.vpc_name}"
  cidr = "10.20.0.0/16"

  azs              = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets  = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
  public_subnets   = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]
  database_subnets = ["10.20.250.0/26", "10.20.250.64/26", "10.20.250.128/26"]

  create_database_subnet_group = false

  enable_nat_gateway   = true
  single_nat_gateway   = false
  enable_dns_hostnames = true
  # https://github.com/terraform-aws-modules/terraform-aws-vpc#external-nat-gateway-ips
  reuse_nat_ips       = true
  external_nat_ip_ids = aws_eip.nat.*.id

  public_subnet_tags = {
    "kubernetes.io/role/elb"                    = ""
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  private_subnet_tags = {
    # "kubernetes.io/role/elb"  = ""
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  tags = {
    Terraform = "true"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

}
