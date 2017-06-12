
# open docker log
```
$ vim /etc/sysconfig/docker
remove --log-driver=journald, or /var/log/containers/ has no logs
```

# Q&A
### cat /var/log/fluentd.log
/var/log/containers/fluentd-es-v1.22-bq4m4_kube-system_fluentd-es-e1a5eac939847469fe5fa5b2c4fc4d55a8026ee1b7454603942c4e85b0a77964.log unreadable
- [/var/log/containers no logs](https://stackoverflow.com/questions/41319233/kubelet-does-not-create-symlinks-to-var-log-containers)


# 参考文献
- [Kubernetes GitHub](https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/fluentd-elasticsearch)
- [部署EFK插件](https://github.com/opsnull/follow-me-install-kubernetes-cluster/blob/master/11-%E9%83%A8%E7%BD%B2EFK%E6%8F%92%E4%BB%B6.md)
- [使用Fluentd和ElasticSearch Stack实现Kubernetes的集群Logging](https://sanwen.net/a/wftbfqo.html)
- [https://github.com/opsnull/follow-me-install-kubernetes-cluster/tree/master/manifests/EFK](https://github.com/opsnull/follow-me-install-kubernetes-cluster/tree/master/manifests/EFK)
- https://github.com/cafebazaar/charts/tree/master/logging/templates
- http://www.golangtc.com/t/58ef557eb09ecc2e180004d6
- [Kubernetes容器集群中的日志系统集成实践](http://www.yunweipai.com/archives/8797.html)
- [fluentd github](https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/fluentd-daemonset-elasticsearch.yaml)
- [fluentd](http://docs.fluentd.org/v0.12/articles/kubernetes-fluentd)
- [ELK stack on Kubernetes](https://crondev.com/elk-stack-kubernetes/)
- https://github.com/pires/kubernetes-elasticsearch-cluster
