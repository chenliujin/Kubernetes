#!/bin/bash
images=(\ 
	kube-apiserver-amd64:v1.6.6 \ 
	kube-controller-manager-amd64:v1.6.6 \ 
	kube-scheduler-amd64:v1.6.6 \ 
	kube-proxy-amd64:v1.6.6 
	)
for imageName in ${images[@]} ; do
	docker pull 	docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName gcr.io/google_containers/$imageName
	docker rmi 	docker.io/chenliujin/$imageName
done
