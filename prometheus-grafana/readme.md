helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install my-kube-prometheus-stack prometheus-community/kube-prometheus-stack --version 70.4.2
grafana:
admin
prom-operator

export POD_NAME=$(kubectl --namespace default get pod -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=my-kube-prometheus-stack" -oname)
kubectl --namespace default port-forward $POD_NAME 3000

$ kubectl port-forward prometheus-my-kube-prometheus-stack-prometheus-0 9090