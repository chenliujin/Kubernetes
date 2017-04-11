# [Download RPM](https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64/repodata/primary.xml)
- kubeadm-1.6.1
- kubectl-1.6.1
- kubelet-1.6.1
- kubernetes-cni-0.5.1

# Kubernetes Images
- gcr.io/google_containers/kube-proxy-amd64:v1.6.0
- gcr.io/google_containers/kube-scheduler-amd64:v1.6.0
- gcr.io/google_containers/kube-controller-manager-amd64:v1.6.0
- gcr.io/google_containers/kube-apiserver-amd64:v1.6.0
- gcr.io/google_containers/nginx-ingress-controller:0.9.0-beta.3
- gcr.io/google_containers/kubernetes-dashboard-amd64:v1.6.0
- gcr.io/google_containers/k8s-dns-dnsmasq-nanny-amd64:1.14.1
- gcr.io/google_containers/k8s-dns-kube-dns-amd64:1.14.1
- gcr.io/google_containers/k8s-dns-sidecar-amd64:1.14.1
- gcr.io/google_containers/pause-amd64:3.0
- gcr.io/google_containers/etcd-amd64:3.0.17


# Docker Conf
- difference of cgroupfs & and systemd?
```
$ vim /usr/lib/systemd/system/docker.service

--exec-opt native.cgroupdriver=cgroupfs
```
or
```
$ vim /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
...
Environment="KUBELET_KUBECONFIG_ARGS=--kubeconfig=/etc/kubernetes/kubelet.conf --require-kubeconfig=true --cgroup-driver=systemd"
```


# Master & Node
```
$ yum install -y socat
$ rpm -ivh kubernetes-cni-0.5.1-0.x86_64.rpm kubelet-1.6.1-0.x86_64.rpm
$ rpm -ivh kubeadm-1.6.1-0.x86_64.rpm kubectl-1.6.1-0.x86_64.rpm
$ systemctl enable kubelet && systemctl start kubelet
$ systemctl status kubelet
$ kubelet logs
```


## Master init
```
$ kubeadm reset
$ kubeadm init --pod-network-cidr=10.244.0.0/16

Your Kubernetes master has initialized successfully!

To start using your cluster, you need to run (as a regular user):

  sudo cp /etc/kubernetes/admin.conf $HOME/
  sudo chown $(id -u):$(id -g) $HOME/admin.conf
  export KUBECONFIG=$HOME/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  http://kubernetes.io/docs/admin/addons/

You can now join any number of machines by running the following on each node
as root:

  kubeadm join --token 7e5bbb.4fbbd530bc3fad91 x.x.x.x:6443
```

# ENV
```
$ vim ~/.bashrc
export KUBECONFIG=/etc/kubernetes/admin.conf

$ source ~/.bashrc
```

# Flannel
```
$ docker pull docker.io/ouyangnb/flannel:v0.7.0-amd64
$ docker tag docker.io/ouyangnb/flannel:v0.7.0-amd64  quay.io/coreos/flannel:v0.7.0-amd64
$ docker rmi docker.io/ouyangnb/flannel:v0.7.0-amd64
$ kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```


# Node
```
$ kubeadm join --token 7e5bbb.4fbbd530bc3fad91 x.x.x.x:6443
```


# 单机安装
允许 Master 节点运行服务（无 node 节点）
```
$ kubectl get nodes
$ kubectl taint nodes {$master_node} dedicated-
```


# 参考文献

- [CentOS 7 安装Kubernetes 1.5.3 集群(本地安装)](http://yoyolive.com/2017/02/27/Kubernetes-1-5-3-Local-Install/)
- [使用kubeadm安装kubernetes 1.5](http://blog.frognew.com/2017/01/install-kubernetes-with-kubeadm.html)
- [kubeadm快速安装kubernetes](http://zkread.com/article/1233049.html)


# 参考文献
- [kubeadm 安装 k8s 1.6](http://blog.csdn.net/iiiiher/article/details/68946587)
- [kukubeadm 1.6.1 + docker1.2.6 安装问题](http://www.itdadao.com/articles/c15a1285927p0.html)
- [kube 1.5.3需要的镜像](https://hub.docker.com/r/ist0ne/kube-proxy-amd64/)
