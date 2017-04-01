#base image on alpine
FROM alpine:latest

#maintainer
MAINTAINER topone4tvs <topone4tvs@163.com>

RUN echo -e "http://dl-3.alpinelinux.org/alpine/edge/main/" >> /etc/apk/repositories 
RUN echo -e "http://dl-5.alpinelinux.org/alpine/edge/main/" >> /etc/apk/repositories 

RUN apk update && apk upgrade
RUN apk add libuser

#install base
RUN apk add rabbitmq-c-0.8.0-r1
#install php
RUN apk add php7 \
    php7-opcache \
    php7-zip \
    php7-mbstring \
    php7-xmlrpc \
    php7-sysvshm \
    php7-amqp \
    php7-doc \
    php7-zlib \
    php7-calendar \
    php7-mysqli \
    php7-soap \
    php7-shmop \
    php7-fpm \
    php7-bz2 \
    php7-sockets \
    php7-pdo_mysql \
    php7-xdebug \
    php7-sysvmsg \
    php7-iconv \
    php7-dev \
    php7-ftp \
    php7-gettext \
    php7-mcrypt \
    php7-xmlreader \
    php7-gd \
    php7-xml \
    php7-pcntl \
    php7-phar \
    php7-apcu \
    php7-ctype \
    php7-pdo \
    php7-openssl \
    php7-memcached \
    php7-common \
    php7-sysvsem \
    php7-posix \
    php7-dom \
    php7-redis \
    php7-curl \
    php7-json \
    php7-bcmath \
    php7-pear \
    php7-solr \
    php7-mongodb \
    php7-mysqlnd \
    php7-xdebug \
    php7-gmagick

#user manager
RUN addgroup -S topone4tvs && adduser -S -G topone4tvs topone4tvs
RUN chmod 4755 ./bin/busybox
#RUN chown -R topone4tvs:topone4tvs /var/www/

ARG LOCAL_IP_ADD

#config php
RUN mv /etc/php7/php.ini /etc/php7/php.ini.bak
RUN rm /etc/php7/php-fpm.d/*.conf
ADD ./php.ini /etc/php7/php.ini
ADD ./php-fpm.conf /etc/php7/php-fpm.d/www.conf
ADD ./xdebug.ini /etc/php7/conf.d/20_xdebug.ini
RUN echo "xdebug.remote_host = ${LOCAL_IP_ADD}" >> /etc/php7/conf.d/20_xdebug.ini


#RUN cd /data/web/
#RUN curl -sS https://getcomposer.org/installer |php7

##install swoole
#RUN apk add linux-headers ##install from source need head
#RUN pecl install swoole ##1.9
##you should install from source if need 2.0
##add ini extension = swoole.so

##install libevent  ## pecl 去掉-n 否则报错
#RUN apk add autoconf gcc g++ libevent libevent-dev make
#RUN pecl install libevent-0.1.0
#RUN chmod +x /usr/lib/php7/modules/libevent.so
## add ini extension = sockets.so  extension=libevent.so

#RUN apk add openssh
#RUN ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key
#RUN sed -i -e "s/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g" /etc/ssh/sshd_config
#RUN ssh-keygen -t rsa
#RUN touch ~/.ssh/authorized_keys

#expose
EXPOSE 9000 9090

#volume
#VOLUME /app

WORKDIR /var/www

#exec command when start container
CMD ["php-fpm7", "-F"]
