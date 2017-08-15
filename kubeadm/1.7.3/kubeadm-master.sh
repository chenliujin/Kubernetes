#!/bin/bash

version=1.7.3
#master=192.168.0.100
token=




#################################################
# 1. install
#################################################

#echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
#echo 1 > /proc/sys/net/bridge/bridge-nf-call-ip6tables

#yum install -y \
#	socat \
#	kubeadm-1.7.3-1.x86_64.rpm \
#	kubectl-1.7.3-1.x86_64.rpm \
#	kubelet-1.7.3-1.x86_64.rpm \
#	kubernetes-cni-0.5.1-0.x86_64.rpm
#
#systemctl enable kubelet
#systemctl start  kubelet
#systemctl status kubelet

## kubelet logs



#################################################
# 2. image
#################################################

# https://console.cloud.google.com/gcr/images/google-containers/GLOBAL/kube-apiserver-amd64
#- gcr.io/google_containers/kube-apiserver-amd64:v1.7.1
#- gcr.io/google_containers/kube-controller-manager-amd64:v1.7.1
#- gcr.io/google_containers/kube-scheduler-amd64:v1.7.1
#- gcr.io/google_containers/kube-proxy-amd64:v1.7.1
#- gcr.io/google_containers/etcd-amd64:3.0.17
#- gcr.io/google_containers/pause-amd64:3.0
#- gcr.io/google_containers/k8s-dns-sidecar-amd64:1.14.4
#- gcr.io/google_containers/k8s-dns-kube-dns-amd64:1.14.4
#- gcr.io/google_containers/k8s-dns-dnsmasq-nanny-amd64:1.14.4
#- gcr.io/google_containers/kubernetes-dashboard-amd64:v1.6.1

# Master
images=(\ 
	kube-apiserver-amd64:v$version \ 
	kube-controller-manager-amd64:v$version \ 
	kube-scheduler-amd64:v$version \ 
	kube-proxy-amd64:v$version \ 
	etcd-amd64:3.0.17 \ 
	pause-amd64:3.0 \ 
	k8s-dns-sidecar-amd64:1.14.4 \ 
	k8s-dns-kube-dns-amd64:1.14.4 \ 
	k8s-dns-dnsmasq-nanny-amd64:1.14.4
	)

########################
# Node
########################

#images=(\ 
#	kube-proxy-amd64:v$version \ 
#	pause-amd64:3.0 \ 
#	k8s-dns-sidecar-amd64:1.14.4 \ 
#	k8s-dns-kube-dns-amd64:1.14.4 \ 
#	k8s-dns-dnsmasq-nanny-amd64:1.14.4
#	)


for imageName in ${images[@]} ; do
	docker pull 	docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName gcr.io/google_containers/$imageName
	docker rmi 	docker.io/chenliujin/$imageName
done



#################################################
# 3. Master
#################################################


kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address $master --token $token --token-ttl 0


#################################################
# 4. Node
#################################################


#kubeadm join --token c63f2f.b20a27a0738fbe16 $master:6443
