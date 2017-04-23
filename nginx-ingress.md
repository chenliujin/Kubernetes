## Docker Images
- gcr.io/google_containers/nginx-ingress-controller:0.9.0-beta.3
- gcr.io/google_containers/defaultbackend:1.3

## Controller
```
$ kubectl apply -f https://rawgit.com/kubernetes/ingress/master/examples/deployment/nginx/kubeadm/nginx-ingress-controller.yaml
```

## Notice
- 设置 nginx-ingress 启动数量：replicas=Node的数量
- 配置 DNS 轮询
```
# 查看 nginx ingress pod 所在的服务器
$ kubectl get pods --all-namespaces -o wide

# 登录所在服务器查看端口是否启用
$ netstat -anp | grep 80
```

## Nginx Ingress
```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: site-ingress
spec:
  rules:
  - host: www.example.com 
    http:
      paths:
      - path: /blog
        backend:
          serviceName: blog
          servicePort: 80
      - path: /music
        backend:
          serviceName: music
          servicePort: 80

```

# TLS


# 参考文献
- [Ingress Resources](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- [Kubeadm using 1.6 - Ingess-Controller cant access API](https://github.com/kubernetes/ingress/issues/575)
- [Deploying the Nginx Ingress controller on kubeadm clusters](https://github.com/kubernetes/ingress/tree/master/examples/deployment/nginx/kubeadm)
- [kubernetes 1.6.1](https://jicki.me/2017/04/11/kargo-k8s-1.6.1/)
- https://github.com/nginxinc/kubernetes-ingress
- [Load Balancing Kubernetes Services with NGINX Plus](https://www.nginx.com/blog/load-balancing-kubernetes-services-nginx-plus/)
