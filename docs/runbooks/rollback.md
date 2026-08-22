# Rollback Runbook

## Purpose
Restore the previous working application version when a deployment fails.

## Automatic Rollback

The Jenkins pipeline monitors the Kubernetes rollout.

If rollout verification fails, Jenkins runs:

kubectl rollout undo deployment/web-app -n dev

The pipeline then exits with a failure status.

## Manual Rollback

View deployment history:

kubectl rollout history deployment/web-app -n dev

Rollback:

kubectl rollout undo deployment/web-app -n dev

Verify:

kubectl rollout status deployment/web-app -n dev