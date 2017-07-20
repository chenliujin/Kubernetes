#!/bin/bash

registry=$1

if [ -z $registry ]; then
	echo 'pls input registry server to push'
	exit
fi	


images=(\ 
	defaultbackend:1.0 \ 
	nginx-ingress-controller:0.9.0-beta.11
	)

for imageName in ${images[@]} ; do
	docker pull 	docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName $registry/$imageName
	docker rmi 	docker.io/chenliujin/$imageName
	docker push $registry/$imageName
done
