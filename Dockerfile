# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM frolvlad/alpine-java:jre8-cleaned

MAINTAINER Ethan Gallant, <ethan@exclnetworks.com>

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig libudev-dev \
 && adduser -D -h /home/container container \
 && ln -s /etc/localtime /etc/timezone

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
