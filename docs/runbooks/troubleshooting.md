# Troubleshooting Runbook

## Check Pods

kubectl get pods -n dev

## Inspect a Pod

kubectl describe pod <POD_NAME> -n dev

## Check Application Logs

kubectl logs <POD_NAME> -n dev

## Check Deployment

kubectl get deployment web-app -n dev

## Check Rollout

kubectl rollout status deployment/web-app -n dev

## Check Service

kubectl get svc web-app -n dev

## Common Problems

### ImagePullBackOff
Check the ECR image URI and IAM permissions.

### CrashLoopBackOff
Check application logs and container configuration.

### Failed Readiness/Liveness Probes
Verify the application is listening on port 3000 and the health-check path is correct.

### Jenkins Deployment Failure
Review Jenkins Console Output and identify the first failed pipeline stage.

### Trivy Failure
Review HIGH and CRITICAL vulnerabilities and update vulnerable packages or the container base image rather than bypassing the security gate.