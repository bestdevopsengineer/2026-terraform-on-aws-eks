    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm install my-kube-prometheus-stack prometheus-community/kube-prometheus-stack --version 70.4.2
    grafana:
    admin
    prom-operator
    
    export POD_NAME=$(kubectl --namespace default get pod -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=my-kube-prometheus-stack" -oname)
    kubectl --namespace default port-forward $POD_NAME 3000
    
    $ kubectl port-forward prometheus-my-kube-prometheus-stack-prometheus-0 9090
    
    ==========================
    ubuntu
    t2 medium
    SG: 22,443,500-1000,80,1000-11000
    
    check grafana download in the browser to see how to install
    sudo apt update
    sudo apt-get install -y adduser libfontconfig1 musl
    
    wget https://dl.grafana.com/enterprise/release/grafana-enterprise_11.6.0_amd64.deb
    sudo dpkg -i grafana-enterprise_11.6.0_amd64.deb
    
    sudo /bin/systemctl daemon-reload
    sudo /bin/systemctl enable grafana-server
    sudo /bin/systemctl start grafana-server
    
    check @ip:3000
     to monitor gibhub 
     click profil, settings,developer settings,personal access token 
     for the scope goto grafana connections, data sources, add data sources,find more
     search for github, install
     scope in github check:
     repo, read:org for admin:org, read:repo_hook for admin:repo_hook
     read:user | user:email for user
     read:enterprise for admin:enterprise
    read:audit_log for audit_log
    read:project for project
    token 
    
    go back to grafana , datasource,find github and past token
    save and test you will see data source is working..
    
    google search : github datasource dashboard grafana
    take github grafana labs
    COPY ID to clipboard
    14000
    goto grafana dashboard , new , import , put 14 000 and load
    add name you want : bestdevopsengineer github
    click down on github to select the correct data source : grafana-github-datasource, import
    
    when everything show:
    select organization : bestdevopsengineer
