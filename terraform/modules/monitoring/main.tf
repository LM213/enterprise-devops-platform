resource "aws_sns_topic" "alerts" {
  name = "${var.environment}-platform-alerts"

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}

resource "aws_cloudwatch_metric_alarm" "eks_cpu_high" {
  alarm_name          = "${var.environment}-eks-cpu-high"
  alarm_description   = "Alerts when average EKS node CPU utilization is high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "node_cpu_utilization"
  namespace           = "ContainerInsights"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    ClusterName = var.eks_cluster_name
  }

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
resource "aws_cloudwatch_dashboard" "eks" {
  dashboard_name = "${var.environment}-eks-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          title  = "EKS Node CPU Utilization"
          region = "us-east-1"

          metrics = [
            [
              "ContainerInsights",
              "node_cpu_utilization",
              "ClusterName",
              var.eks_cluster_name
            ]
          ]

          period = 300
          stat   = "Average"
          view   = "timeSeries"
        }
      }
    ]
  })
}