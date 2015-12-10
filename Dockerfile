FROM hope/base

MAINTAINER Sergey Sadovoi <sergey@hope.ua>

ENV NGINX_VERSION 1.8.0

RUN yum install -y http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm \
     && yum install -y nginx-$NGINX_VERSION \
     && yum clean all

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

ONBUILD COPY Resources/conf /etc/nginx

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
