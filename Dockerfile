FROM ubuntu:latest
MAINTAINER lzs "lzs@zitseng.com"

ARG DEBIAN_FRONTEND=noninteractive

ADD cacert.txt /tmp/
ADD start.sh /root/

RUN \
  apt-get update && \
  apt upgrade -y && \
  apt-get install -y apache2 && \
  apt-get install -y php7.2 php7.2-fpm php7.2-mbstring php7.2-xml php7.2-ldap php7.2-sqlite php7.2-gd php7.2-zip && \
  apt-get install -y vim less wget && \
  a2enmod proxy proxy_fcgi rewrite && \
  cat /tmp/cacert.txt >> /etc/ssl/certs/ca-certificates.crt && \
  rm /tmp/cacert.txt

CMD /root/start.sh

EXPOSE 80
