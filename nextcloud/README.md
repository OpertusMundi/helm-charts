# Nextcloud with OIDC login

This helm chart is a collection of files that describe a set of Kubernetes resources 
to deploy [nextcloud]() application with oidc login to a Kubernetes cluster.

Helm chart is based on the [official](https://github.com/nextcloud/helm) nextcloud helm chart.

## Deploy

1. Edit `secrets/kustomization.yaml` file.
2. Apply secrets with kubectl `kubectl apply -f secrets/`
3. Edit `values.yaml`
4. Deploy nextcloud with `helm install . nextcloud -f values.yaml`