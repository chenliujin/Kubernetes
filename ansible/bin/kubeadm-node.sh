#!/bin/bash

docker pull quay.io/coreos/flannel:v0.10.0-amd64

images=(\ 
  kube-proxy-amd64:v1.11.1 \
  pause:3.1
)

for imageName in ${images[@]} ; do
	docker pull docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName k8s.gcr.io/$imageName
	docker rmi 	docker.io/chenliujin/$imageName
done
