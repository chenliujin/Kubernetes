#!/bin/bash

registry=$1

if [ -z $registry ]; then
	echo 'pls input registry server to push'
	exit
fi	

docker pull 	docker.io/chenliujin/flannel:v0.7.1-amd64
docker tag 	docker.io/chenliujin/flannel:v0.7.1-amd64  $registry/flannel:v0.7.1-amd64
docker rmi 	docker.io/chenliujin/flannel:v0.7.1-amd64

docker push $registry/flannel:v0.7.1-amd64

