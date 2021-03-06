
# k8s install
```
$ kubectl create -f ./kube-config/
```


# Influxdb
## Ingress

# Grafana

## Service
- GF_SERVER_ROOT_URL 由 / 改为 /grafana/ ，方便 ingress
```
        - name: GF_SERVER_ROOT_URL
          value: /grafana/
```

## Ingress
- 需加上 nginx.ingress.kubernetes.io/rewrite-target: / 进行重定向，实际请求的资源在 / 下面，js & css 等文件不在 /grafana/ 下
```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: grafana-ingress
  namespace: kube-system
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: www.chenliujin.com
    http:
      paths:
      - path: /grafana/
        backend:
          serviceName: monitoring-grafana
          servicePort: 80
```

# 参考文献
- [heapster-rbac.yaml](https://github.com/kubernetes/heapster/blob/master/deploy/kube-config/rbac/heapster-rbac.yaml)
- [grafana.yaml](https://github.com/kubernetes/heapster/blob/master/deploy/kube-config/influxdb/grafana.yaml)
- [heapster.yaml](https://github.com/kubernetes/heapster/blob/master/deploy/kube-config/influxdb/heapster.yaml)
- [influxdb.yaml](https://github.com/kubernetes/heapster/blob/master/deploy/kube-config/influxdb/influxdb.yaml)

- [Heapster Metrics](https://github.com/kubernetes/heapster/blob/master/docs/storage-schema.md)
- [kubernetes+docker监控之简介](https://my.oschina.net/fufangchun/blog/714530)
- [Tools for Monitoring Compute, Storage, and Network Resources](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/)
- [Heapster Github](https://github.com/kubernetes/heapster)
- [heapster-rbac.yaml](https://github.com/kubernetes/heapster/blob/master/deploy/kube-config/rbac/heapster-rbac.yaml)
- [heapster.yaml](https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/heapster.yaml)
- [influxdb.yaml](https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/influxdb.yaml)
- [grafana.yaml](https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/grafana.yaml)
- [grafana ingress redirection](https://github.com/kubernetes/contrib/issues/860#issuecomment-250522085)

- [Monitoring Kubernetes with Heapster](https://deis.com/blog/2016/monitoring-kubernetes-with-heapster/)
- https://my.oschina.net/fufangchun/blog/730535
- http://jerrymin.blog.51cto.com/3002256/1904460
