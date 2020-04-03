FROM ubuntu:latest
MAINTAINER lzs "lzs@zitseng.com"

ADD cacert.txt /tmp/
ADD start.sh /root/

RUN \
  apt-get update && \
  apt-get install -y apache2 && \
  apt-get install -y php7.0 php7.0-mbstring php7.0-xml php7.0-ldap php7.0-sqlite php7.0-gd php7.0-zip && \
  apt-get install -y vim less wget && \
  a2enmod proxy proxy_fcgi rewrite && \
  cat /tmp/cacert.txt >> /etc/ssl/certs/ca-certificates.crt && \
  rm /tmp/cacert.txt

CMD /root/start.sh

EXPOSE 80
