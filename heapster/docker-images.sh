#!/bin/bash

registry=$1

if [ -z $registry ]; then
	echo 'pls input registry server to push'
	exit
fi	

images=(\ 
	heapster-grafana-amd64:v4.4.1 \ 
	heapster-influxdb-amd64:v1.1.1 \ 
	heapster-amd64:v1.3.0
	)

for imageName in ${images[@]} ; do
	docker pull 	docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName $registry/google_containers/$imageName
	docker rmi 	docker.io/chenliujin/$imageName

	docker push $registry.io/google_containers/$imageName
done
