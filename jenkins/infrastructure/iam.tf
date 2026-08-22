data "aws_caller_identity" "current" {}

data "aws_ecr_repository" "app" {
  name = "enterprise-devops-app"
}

data "aws_eks_cluster" "dev" {
  name = "dev-eks-cluster"
}

resource "aws_iam_role" "jenkins" {
  name = "dev-jenkins-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "dev-jenkins-role"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_policy" "jenkins" {
  name        = "dev-jenkins-policy"
  description = "Permissions required for Jenkins CI/CD deployments"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "ecr:GetAuthorizationToken"
        ]

        Resource = "*"
      },
      {
        Effect = "Allow"

        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:DescribeImages",
          "ecr:DescribeRepositories",
          "ecr:GetDownloadUrlForLayer",
          "ecr:InitiateLayerUpload",
          "ecr:ListImages",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]

        Resource = data.aws_ecr_repository.app.arn
      },
      {
        Effect = "Allow"

        Action = [
          "eks:DescribeCluster"
        ]

        Resource = data.aws_eks_cluster.dev.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "jenkins" {
  role       = aws_iam_role.jenkins.name
  policy_arn = aws_iam_policy.jenkins.arn
}

resource "aws_iam_instance_profile" "jenkins" {
  name = "dev-jenkins-instance-profile"
  role = aws_iam_role.jenkins.name
}