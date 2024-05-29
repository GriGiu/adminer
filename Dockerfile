FROM debian:buster-slim

MAINTAINER Gri Giu <grillo.giuseppe@gmail.com>

ENV ADMINER_VERSION=4.8.1
ENV MEMORY=256M
ENV UPLOAD=2048M
ENV DEBIAN_FRONTEND=noninteractive

# Unico RUN per aggiornamenti, installazioni e pulizia
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        wget \
        ca-certificates \
        apt-transport-https \
        php7.3 \
        php7.3-mysql \
        php7.3-pgsql \
        php-mongodb && \
    wget https://github.com/vrana/adminer/releases/download/v$ADMINER_VERSION/adminer-$ADMINER_VERSION.php -O /srv/index.php && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /srv
EXPOSE 80

CMD ["/usr/bin/php", \
    "-d", "memory_limit=${MEMORY}", \
    "-d", "upload_max_filesize=${UPLOAD}", \
    "-d", "post_max_size=${UPLOAD}", \
    "-S", "0.0.0.0:80", "/srv/index.php"]
