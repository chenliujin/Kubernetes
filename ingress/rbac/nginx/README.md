
1. kubectl create -f nginx-ingress-controller-rbac.yml
1. kubectl create -f default-backend.yml
1. kubectl create -f nginx-ingress-controller.yml
1. kubectl create -f nginx-ingress-controller-service.yml

- https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/configmap.yaml

# 参考文献
- [NGINX Ingress Controller](https://github.com/kubernetes/ingress-nginx/)
- [NGINX Ingress controller configuration ConfigMap](https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/configmap.md)
