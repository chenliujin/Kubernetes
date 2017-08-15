
```
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
```


# Master
- 必须联网

# [Download RPM](https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64/repodata/primary.xml)
- https://packages.cloud.google.com/yum/pool/f7ec56b0f36a81c0f91bcf26e05f23088082b468b77dac576dc505444dd8cd48-kubeadm-1.7.3-1.x86_64.rpm
- https://packages.cloud.google.com/yum/pool/c8a50a1ce9c948e7a238b02d3967d220e71e13e1ac8916a961176726eabe8aa1-kubectl-1.7.3-1.x86_64.rpm
- https://packages.cloud.google.com/yum/pool/28b76e6e1c2ec397a9b6111045316a0943da73dd5602ee8e53752cdca62409e6-kubelet-1.7.3-1.x86_64.rpm
- https://packages.cloud.google.com/yum/pool/e7a4403227dd24036f3b0615663a371c4e07a95be5fee53505e647fd8ae58aa6-kubernetes-cni-0.5.1-0.x86_64.rpm


## Master init
```
$ kubeadm reset
$ kubeadm init --skip-preflight-checks --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address 192.168.1.100 //使用内外地址

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
$ vim /etc/profile
export KUBECONFIG=/etc/kubernetes/admin.conf

$ source /etc/profile
```


# Node
- gcr.io/google_containers/kube-proxy-amd64:v1.7.1
- gcr.io/google_containers/pause-amd64:3.0
- gcr.io/google_containers/k8s-dns-sidecar-amd64:1.14.4
- gcr.io/google_containers/k8s-dns-kube-dns-amd64:1.14.4
- gcr.io/google_containers/k8s-dns-dnsmasq-nanny-amd64:1.14.4



```
$ kubeadm join --token 7e5bbb.4fbbd530bc3fad91 x.x.x.x:6443
```


# 单机安装
允许 Master 节点运行服务（无 node 节点）
```
$ kubectl get nodes
$ kubectl taint nodes {$master_node} dedicated-
```

# 删除节点（Tear down）
```
$ kubectl drain <node name> --delete-local-data --force --ignore-daemonsets
$ kubectl delete node <node name>
```

# 忘记 Token
```
$ kubeadm token list
```


# 参考文献
- [官方安装文档](https://kubernetes.io/docs/getting-started-guides/kubeadm/)
- [当 Kubernetes 遇到阿里云 之 快速部署1.6.1版本](https://yq.aliyun.com/articles/73922?spm=5176.100239.0.0.nmDR1u)
- [GitBook](https://feisky.gitbooks.io/kubernetes/plugins/rbac.html)



- [kubernetes / understanding CPU resources limits](https://stackoverflow.com/questions/42326645/kubernetes-understanding-cpu-resources-limits)

- [CentOS 7 安装Kubernetes 1.5.3 集群(本地安装)](http://yoyolive.com/2017/02/27/Kubernetes-1-5-3-Local-Install/)
- [使用kubeadm安装kubernetes 1.5](http://blog.frognew.com/2017/01/install-kubernetes-with-kubeadm.html)
- [kubeadm快速安装kubernetes](http://zkread.com/article/1233049.html)


- [阿里云快速部署Kubernetes - VPC环境](https://yq.aliyun.com/articles/66474?commentId=6660)
- [kubeadm 安装 k8s 1.6](http://blog.csdn.net/iiiiher/article/details/68946587)
- [kukubeadm 1.6.1 + docker1.2.6 安装问题](http://www.itdadao.com/articles/c15a1285927p0.html)
- [kube 1.5.3需要的镜像](https://hub.docker.com/r/ist0ne/kube-proxy-amd64/)
- [使用kubeadm在ububtu16.04安装kubernetes1.6.1-flannel](http://blog.csdn.net/ximenghappy/article/details/70157361)
- https://github.com/CNSRE/ABTestingGateway
