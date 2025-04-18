![image](https://github.com/user-attachments/assets/a6bad3b3-fbc4-4494-ae40-44b3bf3c496b)


    apiVersion: apps/v1
    kind: ReplicaSet
    metadata:
      name: nginx-replicaset
      labels:
        app: nginx
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: nginx
      template:
        metadata:
          labels:
            app: nginx
        spec:
          containers:
          - image: nginx:1.27.0
            name: nginx-container
            ports:
              - containerPort: 80
