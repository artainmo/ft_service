FROM alpine

RUN apk add mysql mysql-client

#Add database to the created container
COPY wordpress_database.sql .

EXPOSE 3306
