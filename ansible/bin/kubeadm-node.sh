#!/bin/bash

images=(\ 
	pause:3.1
)

for imageName in ${images[@]} ; do
	docker pull docker.io/chenliujin/$imageName
	docker tag 	docker.io/chenliujin/$imageName k8s.gcr.io/$imageName
	docker rmi 	docker.io/chenliujin/$imageName
done
