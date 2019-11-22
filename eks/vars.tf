variable "aws_region" {
  description = "The AWS region to deploy to (e.g. eu-west-2)"
  type        = string
}

variable "cluster_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "eks_worker_instance_type" {
   description = "What machines to use for the EKS workers"
  type = string
}

variable "config_output_path" {
   description = "Where to output generated kubeconfig file" 
  type = string
}

variable "write_kubeconfig" {
  description = "Whether to output generated kubeconfig file"
  type = string 
}

variable "private_subnets" {
  type = list(string)
}
variable "public_subnets" {
  type = list(string)
}


