1-create k8s cluster in azure
azure subscription1
azureRG
dev/test
demokubernetescluster
zone1
local accounts with kubernetes RBAC

add
demosysnode
azure linux
zone1
Standard B2as v2
manual
110
add node

add
usernode
azure linux
zone1
Standard B2as v2
manual
110
add node

Steps to install ArgoCD on Kubernetes Cluster:

1) Create a namespace argocd using below command:
kubectl create namespace argocd   

2) Install argocd in argocd namespace using below command:
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

3) Verify argocd resources have been created by using below command:
kubectl get all -n argocd

4) Create a LoadBalancer to access argocd over internet in a browser:
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

5) Get LoadBalancer public ip and port of argocd using below command:
kubectl get svc -n argocd

6) Use default username as admin and get the initial password to login to argo cd using below command:

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo