#!/bin/bash

version=1.7.3

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

# kubelet logs


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
for imageName in ${images[@]} ; do
	docker pull 	docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName gcr.io/google_containers/$imageName
	docker rmi 	docker.io/chenliujin/$imageName
done
