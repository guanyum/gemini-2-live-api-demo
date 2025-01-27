FROM nginx:alpine

# 安装必要的工具
RUN apk add --no-cache openssl

# 创建证书存储目录
RUN mkdir -p /etc/nginx/ssl

# 复制网站文件
COPY . /usr/share/nginx/html/

# 复制 nginx 配置
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 复制启动脚本并设置执行权限
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/docker-entrypoint.sh"]