#!/bin/bash

yum install -y \
	socat \
	kubeadm-1.7.3-1.x86_64.rpm \
	kubectl-1.7.3-1.x86_64.rpm \
	kubectl-1.7.3-1.x86_64.rpm \
	kubernetes-cni-0.5.1-0.x86_64.rpm

systemctl enable kubelet
systemctl start  kubelet
systemctl status kubelet

# kubelet logs
