variable "environment" {
  description = "Name of the deployment environment"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster to monitor"
  type        = string
}

variable "alarm_email" {
  description = "Email address that will receive CloudWatch alarm notifications"
  type        = string
}