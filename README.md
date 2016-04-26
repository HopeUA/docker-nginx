# Nginx proxy image

[![hope/nginx](https://img.shields.io/badge/docker-hope/nginx-brightgreen.svg)](https://hub.docker.com/r/hope/nginx/)

Proxy container for apps

Ports: 

* 80  – HTTP
* 443 – HTTPS

## Run

Create __Dockerfile__ with following content

    FROM hope/nginx
    
Copy configuration to __container-files/conf__

Build image

    docker build -t nginx .
      
Run container

    docker run -d -p 80:80 -p 443:443 --name=nginx nginx
