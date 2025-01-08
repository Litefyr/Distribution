FROM oidagroup/neos-worker:8.3-22-alpine

LABEL vendor="Litefyr"
LABEL maintainer="David Spiola"
LABEL org.opencontainers.image.description="Litefyr - Themable Neos"

USER root

COPY ../ /data
ENV ENTRYPOINT_PATH=/data/.docker/neos/docker-entrypoint.d
ENV PHP_TIMEZONE="Europe/Vienna"

# Configure PHP
RUN /usr/local/sbin/configure-php.sh

RUN chown -R docker:docker /data

USER docker:docker

WORKDIR /data
