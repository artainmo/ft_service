FROM alpine

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

#Download phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN rm phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mkdir -p /www
RUN mv phpMyAdmin-4.9.0.1-all-languages/* /www
RUN mkdir -p /run/phpMyadmin #???!!!

#Create telegraf config file, cpu and mem reads input from cpu and memroy usage and sends it to influxdb.
RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default location for configuration file telegraf
RUN mkdir -p /etc/telegraf
RUN mv telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 5000

CMD telegraf && php -S 0.0.0.0:5000 -t /www/
#Command to easily build web server hosting phpmyadmin
#CMD for a shell command with multiple parameters
#php to launch php code
# -S to start built-in web server on the given local address and port
#php [options] -S addr:port [-t docroot]
