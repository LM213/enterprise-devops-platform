output "sns_topic_arn" {
  description = "ARN of the SNS topic used for monitoring alerts"
  value       = aws_sns_topic.alerts.arn
}

output "eks_cpu_alarm_name" {
  description = "Name of the EKS high CPU CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.eks_cpu_high.alarm_name
}
output "dashboard_name" {
  description = "Name of the EKS CloudWatch dashboard"
  value       = aws_cloudwatch_dashboard.eks.dashboard_name
}