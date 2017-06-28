#!/bin/bash
images=(\ 
	kube-apiserver-amd64:v1.6.4 \ 
	kube-controller-manager-amd64:v1.6.4 \ 
	kube-scheduler-amd64:v1.6.4 \ 
	kube-proxy-amd64:v1.6.4 \ 
	etcd-amd64:3.0.17 \ 
	pause-amd64:3.0 \ 
	k8s-dns-sidecar-amd64:1.14.2 \ 
	k8s-dns-kube-dns-amd64:1.14.2 \ 
	k8s-dns-dnsmasq-nanny-amd64:1.14.2 \ 
	kubernetes-dashboard-amd64:v1.6.1 \ 
	defaultbackend:1.0 \ 
	heapster:v1.3.0 \ 
	heapster-influxdb-amd64:v1.1.1 \ 
	heapster-grafana-amd64:v4.0.2 \ 
	nginx-ingress-controller:0.9.0-beta.8
	)
for imageName in ${images[@]} ; do
	docker pull 	docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName gcr.io/google_containers/$imageName
	docker rmi 	docker.io/chenliujin/$imageName
done
