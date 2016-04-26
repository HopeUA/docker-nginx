FROM hope/base-alpine:3.3

MAINTAINER Sergey Sadovoi <sergey@hope.ua>

ENV NGINX_VERSION=1.8.1

RUN \
    apk add --no-cache nginx && \

    # Forward logs to std output
    ln -sf /dev/stdout /var/log/nginx/access.log  && \
    ln -sf /dev/stderr /var/log/nginx/error.log

ONBUILD COPY container-files/conf /etc/nginx

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
