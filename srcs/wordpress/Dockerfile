FROM alpine

RUN apk update && apk add nginx && apk add wget && apk add apache2 php7-apache2  php7 php-mysqli php7-fpm php7-json php-mbstring php-iconv php-gettext php7-session


#Install telegraf with conf towards influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

#Get wordpress folder
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz

#Config wordpress for mysql connection and remove default index
COPY wp-config.php /wordpress/wp-config.php

#Config nginx
RUN adduser -D www; #Creation of user linked with nginx.conf, -D means default
#RUN chown -R www:www /var/lib/nginx #Does not help with wrong php code display
#RUN chown -R www:www /wordpress
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /run/nginx #Last command is demanded by "nginx -t" config file test, to create nginx.pid file
RUN nginx -t
#Check if config file is correct

EXPOSE 5050

CMD nginx -g "daemon off;" #& telegraf
