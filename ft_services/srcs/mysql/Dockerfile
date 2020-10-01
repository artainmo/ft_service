FROM alpine

RUN apk update && apk add mysql mysql-client && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

#Add database to the created container, the database will create the users table, the users itself will be defined in the wp-config
COPY tables.sql /www
COPY users.sql .

CMD mysql -u root < users.sql
#-u for user, root is the user, that contains the different users defined in users.sql

#Create telegraf config file, cpu and mem reads input from cpu and memroy usage and sends it to influxdb.
RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default location for configuration file telegraf
RUN mkdir -p /etc/telegraf
RUN mv telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3306 #Is the default port for the classic MySQL protocol.

CMD telegraf && ....
