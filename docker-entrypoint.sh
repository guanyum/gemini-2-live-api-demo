#!/bin/sh

# 生成自签名证书
if [ ! -f /etc/nginx/ssl/server.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/server.key \
        -out /etc/nginx/ssl/server.crt \
        -subj "/C=CN/ST=State/L=City/O=Organization/CN=localhost"
fi

# 启动 nginx
nginx -g 'daemon off;'