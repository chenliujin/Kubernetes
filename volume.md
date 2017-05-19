# hostPath
- volumns 中的 name 命名必须使用小写和中划线（-），必须以字母结尾
```
    spec:
      containers:
      - name: nginx 
        image: docker.io/nginx 
        imagePullPolicy: Always
        ports:
        - containerPort: 80
        volumeMounts:
          - mountPath: /var/log/nginx
            name: nginx-vol
          - mountPath: /var/log/php-fpm
            name: php-fpm-vol
      volumes:
      - name: nginx-vol
        hostPath:
          path: /var/log/nginx
      - name: php-fpm-vol
        hostPath:
          path: /var/log/php-fpm
```
