FROM debian:stretch-slim

MAINTAINER Gri Giu <grillo.giuseppe@gmail.com>

ENV ADMINER_VERSION=4.7.3
ENV MEMORY=256M
ENV UPLOAD=2048M

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y wget ca-certificates apt-transport-https wget php7.0 php7.0-mysql php7.0-pgsql php-mongodb
RUN    wget https://github.com/vrana/adminer/releases/download/v$ADMINER_VERSION/adminer-$ADMINER_VERSION.php -O /srv/index.php 

WORKDIR srv
EXPOSE 80

CMD /usr/bin/php \
    -d memory_limit=$MEMORY \
    -d upload_max_filesize=$UPLOAD \
    -d post_max_size=$UPLOAD \
    -S 0.0.0.0:80
