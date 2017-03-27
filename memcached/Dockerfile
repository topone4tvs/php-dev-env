#base image on alpine
FROM alpine:latest

#maintainer
MAINTAINER topone4tvs <topone4tvs@163.com>

RUN apk update && apk upgrade
RUN apk add --update

#apk install 
RUN apk add memcached

#config

#expose
EXPOSE 11211

#exec user
USER daemon

#exec command when start container
CMD ["memcached", "-m", "32"]
