#!/bin/bash

registry=$1
version=v0.8.0-amd64

if [ -z $registry ]; then
	echo 'pls input registry server to push'
	exit
fi	

docker pull 	docker.io/chenliujin/flannel:$version
docker tag 	docker.io/chenliujin/flannel:$version  $registry/flannel:$version
docker rmi 	docker.io/chenliujin/flannel:$version

docker push $registry/flannel:$version

