# pods

![image](https://github.com/user-attachments/assets/f28b2f03-6eb4-4391-b0ce-17fc71343441)

![image](https://github.com/user-attachments/assets/f023bc42-ad8b-4d97-b3f8-0f084a0c5ba3)

![image](https://github.com/user-attachments/assets/ab86b04b-0a5e-429f-81d9-ceb02a1f7a2e)

![image](https://github.com/user-attachments/assets/162bb095-f6a6-4abd-a851-5059291797a1)

![image](https://github.com/user-attachments/assets/c0a581d6-7013-4977-800f-ac3e054deabb)

## check your context
    kubectl config current-context
    kubectl config set-context minikube

## if you need help
    kubectl run --help

## start nginx pod
    kubectl run nginx --image=nginx:1.27.0
    kubectl describe pod nginx
    
    kubectl run -it alpine --image=alpine:3.20 sh
    apk --update add curl
    curl 10.244.0.124                #ip@ of the pod
    kubectl logs nginx
    kubectl logs nginx --container=nginx
## expose pod
    kubectl expose pod nginx --type=NodePort --port=80
    kubectl get svc
  
    kubectl run -it alpine --image=alpine:3.20 sh
    apk --update add curl
    curl @service

## create an application
    npm init -y
    npm i --save-exact express@4.19.2
    mkdir src
    
