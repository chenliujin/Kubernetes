#!/bin/bash
images=(\ 
	kube-apiserver-amd64:v1.6.6 \ 
	kube-controller-manager-amd64:v1.6.6 \ 
	kube-scheduler-amd64:v1.6.6 \ 
	kube-proxy-amd64:v1.6.6 \ 
	etcd-amd64:3.0.17 \ 
	pause-amd64:3.0 \ 
	k8s-dns-sidecar-amd64:1.14.2 \ 
	k8s-dns-kube-dns-amd64:1.14.2 \ 
	k8s-dns-dnsmasq-nanny-amd64:1.14.2
	)
for imageName in ${images[@]} ; do
	docker pull 	docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName gcr.io/google_containers/$imageName
	docker rmi 	docker.io/chenliujin/$imageName
done
