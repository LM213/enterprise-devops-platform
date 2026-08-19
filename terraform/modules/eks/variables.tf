variable "environment" {
  description = "Name of the deployment environment"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the EKS cluster will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of the private subnets used by the EKS cluster"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "node_instance_types" {
  description = "EC2 instance types used by the EKS managed node group"
  type        = list(string)
}

variable "node_desired_size" {
  description = "Desired number of worker nodes in the EKS managed node group"
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of worker nodes in the EKS managed node group"
  type        = number
}

variable "node_max_size" {
  description = "Maximum number of worker nodes in the EKS managed node group"
  type        = number
}