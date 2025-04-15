1) Download code from GitHub Repo (https://github.com/bestdevopsengineer/3-checkov.git)
extract and keep in a directory
2) Install Python (https://www.python.org/ftp/python/3.9.12/python-3.9.12-amd64.exe) and do custom installation to install checkov using pip 
pip3 install --upgrade pip && pip3 install --upgrade setuptools
pip3 install checkov

3) Install checkov using pip3
4) Install Terraform >=0.12 (https://developer.hashicorp.com/terraform/downloads) and set environment variable in windows
5) Run checkov from the directory where code is present using below command:

checkov -s -f main.tf


(-s stand for soft fail and -f is used to pass filename to checkov)




