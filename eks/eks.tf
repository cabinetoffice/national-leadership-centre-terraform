module "eks" {
  # source       = "terraform-aws-modules/eks/aws"
  source = "git@github.com:terraform-aws-modules/terraform-aws-eks.git"


  cluster_name = var.cluster_name
  subnets      = var.public_subnets
  vpc_id       = var.vpc_id


  write_kubeconfig      = var.write_kubeconfig
  config_output_path    = var.config_output_path

  worker_groups = [
    {
       instance_type = var.eks_worker_instance_type
       asg_max_size  = 3
       asg_min_size  = 3
       asg_desired_capacity  = 3
       autoscaling_enabled           = true
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



