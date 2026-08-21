variable "aws_region" {
  description = "AWS region for the development environment"
  type        = string
}
variable "environment" {
  description = "Name of the deployment environment"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR block for the development VPC"
  type        = string
}
variable "availability_zones" {
  description = "Availability Zones used by the development environment"
  type        = list(string)
}
variable "public_subnet_cidrs" {
  description = "CIDR blocks for the development public subnets"
  type        = list(string)
}
variable "private_app_subnet_cidrs" {
  description = "CIDR blocks for the development private application subnets"
  type        = list(string)
}
variable "private_db_subnet_cidrs" {
  description = "CIDR blocks for the development private database subnets"
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
variable "ecr_repository_name" {
  description = "Name of the Amazon ECR repository"
  type        = string
}