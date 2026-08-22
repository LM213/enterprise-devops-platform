# Incident Response Runbook

## 1. Detect

CloudWatch monitors platform metrics and sends alerts through Amazon SNS.

## 2. Investigate

Check Kubernetes resources:

kubectl get pods -n dev

kubectl get deployment web-app -n dev

Review application logs:

kubectl logs <POD_NAME> -n dev

Review Jenkins Console Output for recent deployment failures.

## 3. Mitigate

If a recent deployment caused the incident:

kubectl rollout undo deployment/web-app -n dev

## 4. Verify Recovery

kubectl rollout status deployment/web-app -n dev

Confirm Pods are healthy:

kubectl get pods -n dev

Test the application endpoint.

## 5. Document

Record:
- What failed
- When it failed
- Root cause
- Actions taken
- Recovery time
- Preventive actions