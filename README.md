# DEVOPS ICSP  -  RKE2 Ansible Role



[<img src="https://icsp.vn/wp-content/uploads/2022/05/LOGO-ICSP-FA-e1652805360415.png" width=350px>](https://icsp.vn)

This Ansible role will deploy [RKE2](https://docs.rke2.io/) Kubernetes Cluster. RKE2 will be installed using the tarball method.

The Role can install the RKE2 in 3 modes:

- RKE2 single node

- RKE2 Cluster with one Server(Master) node and one or more Agent(Worker) nodes

- RKE2 Cluster with Server(Master) in High Availability mode and zero or more Agent(Worker) nodes. In HA mode you should have an odd number (three recommended) of server(master) nodes that will run etcd, the Kubernetes API (Keepalived VIP or Kube-VIP address), and other control plane services.

---
- Additionally it is possible to install the RKE2 Cluster (all 3 modes) in Air-Gapped functionality with the use of local artifacts.

> It is possible to upgrade RKE2 by changing `rke2_version` variable and re-running the playbook with this role. During the upgrade process the RKE2 service on the nodes will be restarted one by one. The Ansible Role will check if the node on which the service was restarted is in Ready state and only then proceed with restarting service on another Kubernetes node.

## Requirements

* Ansible 2.10+

## Tested on

* Rocky Linux 9
* Ubuntu 24.04 LTS

## Role Variables

This is a copy of `defaults/main.yml`


