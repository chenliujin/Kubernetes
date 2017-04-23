# TLS
```
$ kubectl create secret tls NAME --cert=path/to/cert/file --key=path/to/key/file
```

```
$ kubectl create secret tls www.chenliujin.com --cert=server.pem --key=server.key
```

# 参考文献
- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
