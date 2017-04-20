## Docker Images
- gcr.io/google_containers/nginx-ingress-controller:0.9.0-beta.3
- gcr.io/google_containers/defaultbackend:1.0

## Controller
```
$ kubectl apply -f https://rawgit.com/kubernetes/ingress/master/examples/deployment/nginx/kubeadm/nginx-ingress-controller.yaml
```

## Notice
- 注意 nginx-ingress 启动的服务不一定在 Master 主机上，在 1 Master 1 Node 的集群环境中发现 nginx-ingress 在 Node 中启动了
```
$ netstat -anp | grep 80
```

# 参考文献
- [Ingress Resources](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- [Kubeadm using 1.6 - Ingess-Controller cant access API](https://github.com/kubernetes/ingress/issues/575)
- [Deploying the Nginx Ingress controller on kubeadm clusters](https://github.com/kubernetes/ingress/tree/master/examples/deployment/nginx/kubeadm)
- [kubernetes 1.6.1](https://jicki.me/2017/04/11/kargo-k8s-1.6.1/)
- https://github.com/nginxinc/kubernetes-ingress
