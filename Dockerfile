FROM debian:stretch-slim

MAINTAINER Gri Giu <grigiu@gmail.com>

ENV ADMINER_VERSION=4.6.3
ENV MEMORY=256M
ENV UPLOAD=2048M

RUN apt-get update &&  \
    apt-get upgrade && \
    apt-get install -y \
    wget php7php7-session php7-msqli php7-pgsql php7-mongodb ca-certificates 
 


WORKDIR srv
EXPOSE 80

CMD /usr/bin/php \
    -d memory_limit=$MEMORY \
    -d upload_max_filesize=$UPLOAD \
    -d post_max_size=$UPLOAD \
    -S 0.0.0.0:80


#ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
