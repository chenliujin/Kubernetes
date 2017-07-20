
# registry.io
统一使用私有镜像仓库（registry.io）中的 image，搭建内网集群时不用手动同步 image。

1. cat registry.io.crt >> /etc/pki/tls/certs/ca-bundle.crt
1. systemctl restart docker 
1. hosts


---

- [ ] Ingress
 - [x] nginx

---

- [ ] 监控
 - [x] Heapster + Influxdb + Grafana

---

- [ ] 自动伸缩

---

# 如何升级？

---

1. kubeadm init
1. secret
 - registry.io: namespace
1. flannel
1. ingress
1. service
1. heapster + influxdb + grafana 
