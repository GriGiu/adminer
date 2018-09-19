FROM debian:stretch-slim

MAINTAINER Gri Giu <grigiu@gmail.com>

ENV MEMORY=256M
ENV UPLOAD=2048M

RUN apt-get update && apt-get upgrade && \
    apt-get install -y adminer 

RUN dpkg-query -l | grep adminer *

WORKDIR srv
EXPOSE 80

CMD /usr/bin/php \
    -d memory_limit=$MEMORY \
    -d upload_max_filesize=$UPLOAD \
    -d post_max_size=$UPLOAD \
    -S 0.0.0.0:80
