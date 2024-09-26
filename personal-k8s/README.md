#### Requirement to run playbook




## Getting started

```
cd existing_repo
git remote add origin https://git.mona.host/mona-host/devops/devops-ansible.git
git branch -M main
git push -uf origin main

```

## Edit these lines for suitable cluster , below each variabe is the tag name of each role . You can easily find those variables in the mona-host.yaml playbook .
```
rke2_api_ip : your_IP (example : 10.0.0.120)
+ k8s-cluster-rke2 
+ k8s-rancher-server

hostname : your_domain (example: rancher.mona.host)
+ k8s-bastion
+ k8s-rancher-server

lan_interface: your_LAN_interface (example: eth0)
+ k8s-proxy

```


## Run playbook 
```
######### Change working directory to cloned git repository

cd /git/clone/location 

######### Run Playbook .

ansible-playbook -i inventory/mona-host.yml mona-host.yml

```



