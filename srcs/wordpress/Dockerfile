FROM alpine

RUN apk update && apk add openrc &&  apk add openssl && apk add wget && apk add nginx && apk add php7 php7-fpm php7-iconv php7-json php7-mbstring php7-mysqli php7-phar php7-session
#openrc is a system necessary to start the php-fpm service, that will read the php code for fastCGI for nginx

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
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/user.pem -keyout /etc/nginx/ssl/user.key -subj "/C=BE/ST=Bxl/L=Bruxelles/O=s19/OU=artainmo/CN=ft_services"
RUN adduser -D www; #Creation of user linked with nginx.conf, -D means default
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /wordpress
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /run/nginx #Last command is demanded by "nginx -t" config file test, to create nginx.pid file
RUN nginx -t
#Check if config file is correct

EXPOSE 5050

COPY start.sh .
RUN chmod +x start.sh
CMD ./start.sh
