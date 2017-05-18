# nodeSelector
- 在 node 打标签，replicationController 中的 pod 指定在这些标签上的 node 运行

### 打标签（label）
```
# kubectl label nodes {node-name} {label_key=label_value}
$ kubectl label nodes x.x.x.x node=mongo
$ kubectl get node -a -l "node=mongo"
```

### 删除已添加的 label：key 后面加 - 表示为删除这个 key 的 label
```
$ kubectl label nodex x.x.x.x node-
```

## rc
```
apiVersion: v1
kind: ReplicationController
metadata:
 name: mongo
spec:
 replicas: 1 
 template:
   metadata:
     labels:
       run: mongo
   spec:
     containers:
     - name: mongo
       image: docker.io/mongo
       ports:
         - containerPort: 27017
       volumeMounts:
         - mountPath: /data/db
           name: mongo
     volumes: [{"name":"mongo","hostPath":{"path":"/root/volumes/mongo"}}]
     nodeSelector: 
       node: mongo
```

# 参考文献
- [K8S对node添加label，并根据label筛选节点](http://blog.csdn.net/gsying1474/article/details/59057519)
