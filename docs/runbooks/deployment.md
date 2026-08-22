# Deployment Runbook

## Purpose
Procedure for deploying the Enterprise DevOps Platform application to Amazon EKS.

## Automated Deployment Flow
1. Developer pushes code to GitHub.
2. Jenkins checks out the repository.
3. Jenkins installs application dependencies.
4. Automated tests run.
5. Jenkins builds a versioned Docker image.
6. Trivy scans the image for HIGH and CRITICAL vulnerabilities.
7. Jenkins authenticates with Amazon ECR.
8. The Docker image is pushed to ECR.
9. Jenkins updates the EKS deployment with the new image.
10. Kubernetes performs a rolling deployment.
11. Jenkins verifies rollout status.
12. Jenkins performs an application health check.

## Verification

Check deployment:

kubectl get deployment web-app -n dev

Check Pods:

kubectl get pods -n dev

Check application:

kubectl get svc web-app -n dev