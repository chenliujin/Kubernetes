#!/bin/bash
images=(\ 
	kube-apiserver-amd64:v1.7.0 \ 
	kube-controller-manager-amd64:v1.7.0 \ 
	kube-scheduler-amd64:v1.7.0 \ 
	kube-proxy-amd64:v1.7.0 \ 
	etcd-amd64:3.0.17 \ 
	pause-amd64:3.0 \ 
	k8s-dns-sidecar-amd64:1.14.2 \ 
	k8s-dns-kube-dns-amd64:1.14.2 \ 
	k8s-dns-dnsmasq-nanny-amd64:1.14.2 \
	defaultbackend:1.0 \ 
	nginx-ingress-controller:0.9.0-beta.10
	)
for imageName in ${images[@]} ; do
	docker pull 	docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName gcr.io/google_containers/$imageName
	docker rmi 	docker.io/chenliujin/$imageName
done
