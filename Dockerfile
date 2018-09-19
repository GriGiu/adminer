FROM debian:stretch-slim

MAINTAINER Gri Giu <grigiu@gmail.com>

ENV ADMINER_VERSION=4.6.3
ENV MEMORY=256M
ENV UPLOAD=2048M

RUN apt-get update &&  \
    apt-get upgrade && \
    apt-get install -y \
    wget php5 php5-pgsql php5-mysql ca-certificates 
# wget php7 php7-session php7-msqli php7-pgsql php7-mongodb ca-certificates 
 
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://github.com/sgerrand/alpine-pkg-php5-mongo/releases/download/1.6.14-r0/sgerrand.rsa.pub && \
#    wget https://github.com/sgerrand/alpine-pkg-php5-mongo/releases/download/1.6.14-r0/php5-mongo-1.6.14-r0.apk && \
#         apk add php5-mongo-1.6.14-r0.apk && \
    wget https://github.com/vrana/adminer/releases/download/v$ADMINER_VERSION/adminer-$ADMINER_VERSION.php -O /srv/index.php && \
#    apk del wget ca-certificates && \
    rm -rf /var/cache/apk/*

WORKDIR srv
EXPOSE 80

CMD /usr/bin/php \
    -d memory_limit=$MEMORY \
    -d upload_max_filesize=$UPLOAD \
    -d post_max_size=$UPLOAD \
    -S 0.0.0.0:80


#ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
