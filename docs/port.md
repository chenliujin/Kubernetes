| Port | 用途 |
| --- | --- |
| 30006 | MySQL |
| 30080 | http |



# service
- nodePort: kube-proxy 负载均衡的端口
- port: service 的端口
- targetPort: 目标容器的端口


# controller
- containerPort: 容器的端口，如 http:80 https:443 
- hostPort: 宿主机器的端口
