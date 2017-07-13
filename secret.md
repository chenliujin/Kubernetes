# TLS
```
$ kubectl create secret tls NAME --cert=path/to/cert/file --key=path/to/key/file
```

```
$ kubectl create secret tls www.chenliujin.com --cert=server.pem --key=server.key
```

# registry 
```
kubectl create secret docker-registry registry.io --docker-server=registry.io:5000 --docker-username={UserName} --docker-password={Password} --docker-email=liujin.chen@qq.com
```

# 参考文献
- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
