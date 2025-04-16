# Deploy applications
    SERVICE
  
    kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
    kubectl expose deployment hello-minikube --type=NodePort --port=8080
    kubectl get services hello-minikube
  
    The easiest way to access this service is to let minikube launch a web browser for you:
    minikube service hello-minikube



  
