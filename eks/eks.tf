module "eks" {
  source          = "terraform-aws-modules/eks/aws"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version

  subnets      = var.public_subnets
  vpc_id       = var.vpc_id
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access = true

  write_kubeconfig      = var.write_kubeconfig
  config_output_path    = var.config_output_path

  worker_groups = [
    {
       instance_type = var.eks_worker_instance_type
       asg_max_size  = 6
       asg_min_size  = 3
       ami_id = var.ami_id
       asg_desired_capacity = 3
       autoscaling_enabled = true
       # protect_from_scale_in         = true
      tags = [{
        key                 = "terraform_managed"
        value               = "true"
        propagate_at_launch = true
      }]
    }
  ]

  manage_aws_auth                      = var.manage_aws_auth
  map_roles                            = var.map_roles
  map_users                            = var.map_users
  map_accounts                         = var.map_accounts
}
