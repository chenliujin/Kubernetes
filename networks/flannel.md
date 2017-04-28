

```
$ kubectl create -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel-rbac.yml
```




# firewalld
```
$ systemctl status firewalld
$ systemctl stop firewalld
```


```
$ kubectl apply -f http://aliacs-k8s.oss-cn-hangzhou.aliyuncs.com/conf/flannel-vxlan.yml
```


# 参考文献
- [当 Kubernetes 遇到阿里云](https://yq.aliyun.com/articles/68921#)
- [kukubeadm 1.6.1 + docker1.2.6 安装问题 : 多网卡](http://www.cnblogs.com/fengjian2016/p/6689212.html?utm_source=itdadao&utm_medium=referral)
