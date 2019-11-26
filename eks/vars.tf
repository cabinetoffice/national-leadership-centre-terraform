variable "aws_region" {
  description = "The AWS region to deploy to (e.g. eu-west-2)"
  type        = string
}

variable "cluster_name" {
  type = string
 description = "The name the EKS cluster will have (e.g. nlc-prod)"
}

variable "vpc_id" {
  type = string
}

variable "eks_worker_instance_type" {
   description = "What machines to use for the EKS workers (e.g. c3.medium)"
   type = string
}

variable "config_output_path" {
   description = "Where to output generated kubeconfig file (e.g. /tmp)" 
   type = string
}

variable "write_kubeconfig" {
   description = "Whether to output generated kubeconfig file (e.g. .kubeconfig-my-cluster)"
   type = string 
}

variable "private_subnets" {
   type = list(string)
}

variable "public_subnets" {
   type = list(string)
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)
  default = [ ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = []
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  # default none - shown for example only
  default = []
}




