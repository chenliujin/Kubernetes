#!/bin/bash

registry=$1

if [ -z $registry ]; then
	echo 'pls input registry server to push'
	exit
fi	


images=(\ 
	nginx-ingress-controller:0.9.0-beta.11 \ 
	defaultbackend:1.0
	)

for imageName in ${images[@]} ; do
	docker pull 	docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName $registry/google_containers/$imageName
	docker rmi 	docker.io/chenliujin/$imageName
	docker push $registry/google_containers/$imageName
done
