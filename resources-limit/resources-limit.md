# 资源配额限制
在 Kubernetes 里，一个计算资源进行配额限定需要设定以下两个参数：
- Requests: 该资源的最小申请量，系统必须满足要求。
- Limits: 该资源最大允许使用的量，不能被突破，当容器试图使用超过这个量的资源时，可能会被 Kubernetes Kill 并重启。

## CPU
CPU 的资源单位为 CPU（core）的数量。在 kubernetes 里，通常以千分之一的 cpu 配额为最小单位，用 m 来表示。定义为 500m 表示占用 0.5 个 cpu。

## example
```
spec:
  containers:
  - name: db
    image: mysql
    resources:
      requests:
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "500m"
```
