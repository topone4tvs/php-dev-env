#base image on alpine
FROM alpine:latest

#maintainer
MAINTAINER topone4tvs <topone4tvs@163.com>

RUN apk update && apk upgrade

#apk install nginx
RUN apk add nginx

ARG PHP_UPSTREAM=php-fpm

RUN rm /etc/nginx/conf.d/default.conf && \
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
ADD nginx.conf /etc/nginx/nginx.conf
RUN echo "upstream php-upstream { server ${PHP_UPSTREAM}:9000; }" > /etc/nginx/conf.d/upstream.conf

#expose
EXPOSE 80 443

#exec command when start container
CMD ["nginx", "-g", "daemon off;"]
#ENTRYPOINT /bin/sh
