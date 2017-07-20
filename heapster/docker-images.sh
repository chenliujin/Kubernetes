#!/bin/bash

images=(\ 
	heapster-grafana-amd64:v4.4.1 \ 
	heapster-influxdb-amd64:v1.1.1 \ 
	heapster-amd64:v1.3.0
	)
for imageName in ${images[@]} ; do
	docker pull 	docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName registry.io:5000/$imageName
	docker rmi 	docker.io/chenliujin/$imageName

	docker push registry.io:5000/$imageName
done
