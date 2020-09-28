FROM alpine

RUN apk update apk add mysql mysql-client

#Add database to the created container, the database will create the users table, the users itself will be defined in the wp-config
COPY tables.sql /www
COPY users.sql .

CMD mysql -u root < users.sql
#-u for user, root is the user, that contains the different users defined in users.sql

EXPOSE 3306 #Is the default port for the classic MySQL protocol.
