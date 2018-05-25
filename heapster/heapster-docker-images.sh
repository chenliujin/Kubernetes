#!/bin/bash

registry=$1

if [ -z $registry ]; then
	echo 'pls input registry server to push'
	exit
fi	

images=(\ 
	heapster-grafana-amd64:v4.4.3 \ 
	heapster-influxdb-amd64:v1.3.3 \ 
	heapster-amd64:v1.5.3
)

for imageName in ${images[@]} ; do
	docker pull docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName $registry/$imageName
	docker rmi 	docker.io/chenliujin/$imageName

	docker push $registry/$imageName
done
