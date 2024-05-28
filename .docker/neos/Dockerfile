FROM davidspiola/neos:8.1-node18

LABEL vendor="Litefyr"
LABEL maintainer="David Spiola"
LABEL org.opencontainers.image.description "Litefyr - Themable Neos"

USER root

COPY ../ /data
COPY ../.docker/neos/docker-entrypoint.d /docker-entrypoint.d

ENV PHP_TIMEZONE Europe/Vienna

# Configure PHP
RUN /usr/local/sbin/configure-php.sh

RUN chown -R docker:docker /data
RUN chown -R docker:docker /docker-entrypoint.d

USER docker:docker

WORKDIR /data
