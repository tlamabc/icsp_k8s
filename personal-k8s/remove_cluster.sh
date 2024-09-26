#!/bin/bash
#### Huong dan su dung
echo "Please Specify remote host . You are running on localhost which is DANGEROUS ."

echo "Chay script lan 1 . Reboot cac node . Sau do chay script lan 2 de remove cac CNI "

./remove_cluster.sh IP_NODE_1 IP_NODE_2 .... 

####################
# Function to remove RKE2
remove_rke2() {
    echo "Stopping RKE2 service..."
    systemctl stop rke2-server
    systemctl stop rke2-agent

    echo "Disabling RKE2 service..."
    systemctl disable rke2-server
    systemctl disable rke2-agent

    echo "Removing RKE2 binaries and configurations..."
    rm -rf /etc/rancher/rke2
    rm -rf /var/lib/rancher/rke2
    rm -rf /var/lib/kubelet
    rm -rf /var/lib/etcd
    rm -rf /var/lib/cni
    rm -rf /run/flannel
    rm -rf /etc/cni
    rm -rf /opt/cni
    rm -rf /etc/kubernetes
    rm -rf /var/log/containers
    rm -rf /var/log/pods
    rm -rf /usr/local/bin/rke2
    rm -rf /usr/local/bin/kubectl
    rm -rf /usr/local/bin/crictl
    rm -rf /usr/local/bin/containerd
    rm -rf /usr/local/bin/containerd-shim
    rm -rf /usr/local/bin/ctr
    rm -rf /usr/local/bin/runc
    rm -rf /var/lib/rancher/k3s

    echo "Cleaning up iptables rules..."
    iptables -F
    iptables -t nat -F
    iptables -t mangle -F
    iptables -X

    echo "Removing CNI network interfaces..."
    ip link delete cni0
    ip link delete flannel.1

    echo "RKE2 has been removed from $(hostname)."
}

# Function to remove RKE2 on a remote node
remove_rke2_remote() {
    NODE=$1
    echo "Removing RKE2 from remote node $NODE..."
    ssh root@$NODE "$(declare -f remove_rke2); remove_rke2"
}

# Main script
if [ "$#" -eq 0 ]; then
    echo "Please Specify remote host . You are running on localhost which is DANGEROUS ."
else
    for node in "$@"; do
        remove_rke2_remote $node
    done
fi

echo "RKE2 cluster removal complete."
