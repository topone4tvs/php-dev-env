#base image on alpine
FROM alpine:latest

#maintainer
MAINTAINER topone4tvs <topone4tvs@163.com>

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*

COPY my.cnf /etc/mysql/my.cnf

RUN mkdir -p /run/mysqld
COPY startup.sh /run/mysqld/startup.sh
RUN chmod +x /run/mysqld/startup.sh

EXPOSE 3306

#ENTRYPOINT /bin/sh
CMD ["/run/mysqld/startup.sh"]
