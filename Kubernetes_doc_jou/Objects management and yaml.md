![image](https://github.com/user-attachments/assets/e7653f70-8cbc-4f6c-88cc-c6c84b006e08)
![image](https://github.com/user-attachments/assets/4edca004-5182-425e-9b17-adb14878f9dd)

nginx-pod.yaml

apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: nginx
spec:
  containers:
    - image: nginx:1.27.0
      name: nginx-container
      ports:
        - containerPort: 80

 kubectl create -f nginx-pod.yaml 
 
![image](https://github.com/user-attachments/assets/b6c5bea5-12b9-4050-92d9-782ba6e37f37)

nginx-svc.yaml

apiVersion: v1
kind: Service
metadata:
  name: nginx-svc
  labels:
    app: nginx
spec:
  type: NodePort
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: nginx


    kubectl create -f nginx-svc.yaml

    kubectl port-forward svc/nginx-svc 8080:80
    http://127.0.0.1:8080


    kubectl run color-api --image=lmacademy/color-api:1.0.0 --dry-run=client -o yaml
