#MySQL is a database used by wordpress. Wordpress creates its html files dynamically, making queries to mysql database and based on data creates html file.
#Phpmyadmin can be used to manage the mysql database through your browser, easy to use interface.
#A wordpress database contains tables, each table contains data for different wordpress sections, default mysql table https://www.h3xed.com/web-development/wordpress-4-8-2-empty-clean-mysql-database-sql-file

FROM alpine

RUN apk update && apk add mysql mysql-client && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

#Add the default wordpress tables for creation of database in container
COPY tables.sql .
COPY users.sql .

#Create telegraf config file, cpu and mem reads input from cpu and memroy usage and sends it to influxdb.
RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default location for configuration file telegraf
RUN mkdir -p /etc/telegraf
RUN mv telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3306 #Is the default port for the classic MySQL protocol.

CMD telegraf && mysql -u root < users.sql
#-u for user, root is the user, that contains the different users defined in users.sql, use this command to launch mysql by giving user and its password
