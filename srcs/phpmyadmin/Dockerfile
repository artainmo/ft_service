FROM alpine

RUN apk update && apk add openrc && apk add wget && apk add nginx && apk add php7 php7-fpm php7-iconv php7-json php7-mbstring php7-mysqli php7-phar php7-session

#Install telegraf with conf towards influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

#Get phpMyAdmin folder
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin
RUN rm phpMyAdmin-4.9.0.1-all-languages.tar.gz

#Set phpmyadmin and its config
COPY config.inc.php phpmyadmin/config.inc.php

#Config nginx
RUN adduser -D www; #Creation of user linked with nginx.conf, -D means default
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /phpmyadmin
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /run/nginx #Last command is demanded by "nginx -t" config file test, to create nginx.pid file
RUN nginx -t
#Check if config file is correct

COPY start.sh .
RUN chmod +x start.sh
CMD ./start.sh
