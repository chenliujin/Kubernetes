
# registry.io
统一使用私有镜像仓库（registry.io）中的 image，搭建内网集群时不用手动同步 image。

1. cat registry.io.crt >> /etc/pki/tls/certs/ca-bundle.crt
1. systemctl restart docker 
1. hosts


---

- [ ] Ingress
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
