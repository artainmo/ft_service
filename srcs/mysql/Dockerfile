#MySQL is a database used by wordpress. Wordpress creates its html files dynamically, making queries to mysql database and based on data creates html file.
#Phpmyadmin can be used to manage the mysql database through your browser, easy to use interface.

FROM alpine:latest

RUN apk update && apk add mysql mysql-client

#Install telegraf with conf towards influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

#Config file mysql
COPY my.cnf /etc/

#Set the starting script
COPY start.sh .
RUN chmod +x start.sh

EXPOSE 3306

CMD ./start.sh
