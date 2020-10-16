FROM alpine

RUN apk update && apk add php7-apache2 php7 php-mysqli php7-fpm php7-json php-mbstring php-iconv php-gettext php7-session

#Install telegraf with conf towards influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

#Get phpMyAdmin folder
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN rm phpMyAdmin-4.9.0.1-all-languages.tar.gz

#Set phpmyadmin and its config
RUN rm -f /var/www/localhost/htdocs/index.html #remove the hhtpd index file "It works!"
RUN mv phpMyAdmin-4.9.0.1-all-languages/* /var/www/localhost/htdocs/
COPY config.inc.php var/www/localhost/htdocs/config.inc.php

EXPOSE 5000

CMD telegraf & httpd -D FOREGROUND
#httpd is an apache http server, it runs as deamon process
