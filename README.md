# 服务器
- k1: 公网IP
- k2: 公网IP，需要调用第三方服务网关的服务部署到 k2

# registry.io
统一使用私有镜像仓库（registry.io）中的 image，搭建内网集群时不用手动同步 image。

1. cat registry.io.crt >> /etc/pki/tls/certs/ca-bundle.crt
1. systemctl restart docker 
1. hosts


---

# Ingress
- [x] nginx

---

# 监控

## Heapster + Influxdb + Grafana

---

- [ ] 自动伸缩

---

# 如何升级？

---

1. kubeadm init
2. secret
 - registry.io: 
  - --namespace=default
  - --namespace=kube-system
  - --namespace=nginx-ingress
3. flannel
4. ingress
5. service

# 参考文献
- https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/
- [Configure Liveness and Readiness Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/)
