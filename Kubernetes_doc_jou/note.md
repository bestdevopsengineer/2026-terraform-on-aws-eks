# Deploy applications

    SERVICE  
    # Create a sample deployment and expose it on port 8080:
    kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
    kubectl expose deployment hello-minikube --type=NodePort --port=8080
    kubectl get services hello-minikube
  
    The easiest way to access this service is to let minikube launch a web browser for you:
    minikube service hello-minikube   OR  kubectl port-forward service/hello-minikube 7080:8080

    LOADBALANCER
    # To access a LoadBalancer deployment
    kubectl create deployment balanced --image=kicbase/echo-server:1.0
    kubectl expose deployment balanced --type=LoadBalancer --port=8080

    In another window, start the tunnel to create a routable IP for the ‘balanced’ deployment:
    minikube tunnel
    To find the routable IP, run this command and examine the EXTERNAL-IP column:
    kubectl get services balanced

    INGRESS
    # minikube addons enable ingress
    The following example creates simple echo-server services and an Ingress object to route to these services.

    ingress-example.yaml
    
    kind: Pod
    apiVersion: v1
    metadata:
      name: foo-app
      labels:
        app: foo
    spec:
      containers:
        - name: foo-app
          image: 'kicbase/echo-server:1.0'
    ---
    kind: Service
    apiVersion: v1
    metadata:
      name: foo-service
    spec:
      selector:
        app: foo
      ports:
        - port: 8080
    ---
    kind: Pod
    apiVersion: v1
    metadata:
      name: bar-app
      labels:
        app: bar
    spec:
      containers:
        - name: bar-app
          image: 'kicbase/echo-server:1.0'
    ---
    kind: Service
    apiVersion: v1
    metadata:
      name: bar-service
    spec:
      selector:
        app: bar
      ports:
        - port: 8080
    ---
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: example-ingress
    spec:
      rules:
        - http:
            paths:
              - pathType: Prefix
                path: /foo
                backend:
                  service:
                    name: foo-service
                    port:
                      number: 8080
              - pathType: Prefix
                path: /bar
                backend:
                  service:
                    name: bar-service
                    port:
                      number: 8080
    ---
    
        
    kubectl apply -f ingress-example.yaml
    kubectl get ingress
    
    

    



  
