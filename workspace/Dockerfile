#base image on alpine
FROM alpine:latest

#maintainer
MAINTAINER topone4tvs <topone4tvs@163.com>

#RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/edge/testing\nhttp://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-1.alpinelinux.org/alpine/edge/main\nhttp://dl-2.alpinelinux.org/alpine/edge/main\nhttp://dl-3.alpinelinux.org/alpine/edge/main\nhttp://dl-4.alpinelinux.org/alpine/edge/main\nhttp://dl-5.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories 
RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories 

RUN apk add --update
RUN apk update && apk upgrade

RUN apk add vim curl sudo

#RUN apk add git
#RUN cd ~
#RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#RUN git clone https://github.com/topone4tvs/vim-php-ide-use-vundle.git
#RUN cp vim-php-ide-use-vundle.git/_vimrc ./.vimrc && rm -rf vim-php-ide-use-vundle.git
#RUN nohup vim +PluginInstall +qall > /dev/null &2>1 &

#install php
RUN apk add rabbitmq-c
RUN apk add php7 \
    php7-opcache \
    php7-mbstring \
    php7-zip \
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
    php7-gmagick

#install mysql
RUN apk add --update mysql mysql-client

WORKDIR /var/www

#command
ENTRYPOINT /bin/sh
