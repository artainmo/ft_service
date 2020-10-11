FROM alpine
ARG IP

RUN apk update && apk add wget && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

#Get wordpress through zip
RUN wget https://wordpress.org/latest.tar.gz
#x for extract archive, v verbal display info, f use archive file
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz
RUN mkdir /www
RUN mv wordpress/* /www
RUN rm -rf wordpress
COPY wp-config.php /www/wp-config.php
#Use sed command to change default IP by minikube ip
RUN sed -i "s/sed123/$IP/" /www/wp-config.php

#Create telegraf config file, cpu and mem reads input from cpu and memory usage and sends it to influxdb.
RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default location for configuration file telegraf
RUN rm -rf etc/telegraf.conf.d etc/telegraf.conf
RUN mkdir etc/telegraf
RUN mv telegraf.conf etc/telegraf/telegraf.conf

EXPOSE 5050

#Command to easily build web server hosting wordpress
CMD php -S 0.0.0.0:5050 -t /www/ && telegraf
#php to launch php code
# -S to start built-in web server on the given local address and port
#php [options] -S addr:port [-t docroot]

#local testing
#docker build -t img --build-arg IP=0.0.0.0 .
#docker run -d -p 5050:5050 img
