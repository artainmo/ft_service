FROM alpine

RUN apk update && apk add wget && apk add php7-apache2 php7 php-mysqli php7-fpm php7-json

#Install telegraf with conf towards influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

#Get wordpress folder
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz

#Set wordpress and wp-config.php
RUN rm -f /var/www/localhost/htdocs/index.html #remove the hhtpd index file "It works!"
RUN mv wordpress/* /var/www/localhost/htdocs/
COPY wp-config.php /var/www/localhost/htdocs/wp-config.php

EXPOSE 5050

CMD telegraf & httpd -D FOREGROUND
#httpd is an apache http server, it runs as deamon process
