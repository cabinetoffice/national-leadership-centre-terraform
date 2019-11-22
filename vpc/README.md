# eu-west-2 vpc

## Modules

The following [registry.terraform.io](registry.terraform.io) modules are used:

* [VPC]
* [Security Group]

## What is deployed

1. A new VPC in `eu-west-2`. CIDR ranges configured in [`vpc.tf`](vpc.tf).  Spread across the three AZ's in `eu-west-2`. Consisting of the following subnets:
    * 3 public subnets (`/24`)
    * 3 private subnets (`/24`)
    * 3 DB subnets (including a RDS Subnet Group) (`/26`)

[Security Group]: https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/1.15.0
[VPC]: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/1.23.0