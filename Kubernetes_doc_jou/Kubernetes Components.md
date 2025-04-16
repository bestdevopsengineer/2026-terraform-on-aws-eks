![image](https://github.com/user-attachments/assets/32a70299-3a23-461f-ab8b-17a8e4b46a92)

# Core Components
    control plane ,
    one or more worker nodes

# Control Plane Components
Manage the overall state of the cluster:
1-kube-apiserver
The core component server that exposes the Kubernetes HTTP API
2-etcd
Consistent and highly-available key value store for all API server data
3-kube-scheduler
Looks for Pods not yet bound to a node, and assigns each Pod to a suitable node.
4-kube-controller-manager
Runs controllers to implement Kubernetes API behavior.
5-cloud-controller-manager (optional)
Integrates with underlying cloud provider(s).

# Node Components 
    Run on every node, maintaining running pods and providing the Kubernetes runtime environment:
    1-kubelet
    Ensures that Pods are running, including their containers.
    2-kube-proxy (optional)
    Maintains network rules on nodes to implement Services.
    3-Container runtime
    Software responsible for running containers. Read Container Runtimes to learn more.

# Addons
    Addons extend the functionality of Kubernetes. A few important examples include:
    1-DNS
    For cluster-wide DNS resolution
    2-Web UI (Dashboard)
    For cluster management via a web interface
    3-Container Resource Monitoring
    For collecting and storing container metrics
    4-Cluster-level Logging
    For saving container logs to a central log store
