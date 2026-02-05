FROM debian:bookworm-slim

LABEL maintainer="Gri Giu <grillo.giuseppe@gmail.com>"

ENV ADMINER_VERSION=5.4.1 \
    MEMORY=256M \
    UPLOAD=2048M \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        php-cli \
        php-mysql \
        php-pgsql \
        php-sqlite3 \
        php-mongodb \
    && curl -fsSL "https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php" -o /srv/index.php \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv
EXPOSE 80

CMD ["/usr/bin/php", \
    "-d", "memory_limit=${MEMORY}", \
    "-d", "upload_max_filesize=${UPLOAD}", \
    "-d", "post_max_size=${UPLOAD}", \
    "-S", "0.0.0.0:80", "/srv/index.php"]
