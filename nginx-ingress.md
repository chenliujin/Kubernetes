## Docker Images
- gcr.io/google_containers/nginx-ingress-controller:0.9.0-beta.3
- gcr.io/google_containers/defaultbackend:1.0

## Controller
```
$ kubectl apply -f https://rawgit.com/kubernetes/ingress/master/examples/deployment/nginx/kubeadm/nginx-ingress-controller.yaml
```

# 参考文献
- [Deploying the Nginx Ingress controller on kubeadm clusters](https://github.com/kubernetes/ingress/tree/master/examples/deployment/nginx/kubeadm)
- [kubernetes 1.6.1](https://jicki.me/2017/04/11/kargo-k8s-1.6.1/)
- https://github.com/nginxinc/kubernetes-ingress
