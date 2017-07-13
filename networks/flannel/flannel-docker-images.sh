#!/bin/bash

docker pull 	docker.io/chenliujin/flannel:v0.7.1-amd64
docker tag 	docker.io/chenliujin/flannel:v0.7.1-amd64  registry.io:5000/flannel:v0.7.1-amd64
docker rmi 	docker.io/chenliujin/flannel:v0.7.1-amd64

docker push registry.io:5000/flannel:v0.7.1-amd64

