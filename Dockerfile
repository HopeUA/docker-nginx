FROM hope/alpine:3.6

ENV \
    NGINX_VERSION=1.12.0 \
    NGINX_CONFIG=/etc/nginx/nginx.conf

RUN \
    apk add --no-cache nginx && \

    # Forward logs to std output
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY rootfs/ /

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["nginx"]
CMD ["-c", "/etc/nginx/nginx.conf"]
