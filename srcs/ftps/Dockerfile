#FTPS is based on the FTP potocol. FTP is a protocol that has one server and multiple clients, the clients connect to the server to transfer files from one system to another. FTPS uses ssl.
#ftp platform -> https://filezilla-project.org/
#https://www.pureftpd.org/project/pure-ftpd/
#https://download.pureftpd.org/pub/pure-ftpd/doc/README

FROM alpine

RUN apk update && apk add openssl && apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
#pure-ftpd is a free, secured version of ftp that works with ssl and that runs in background => what we need for ftps

#Install telegraf with conf towards influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

#ssl on pure-ftp
RUN mkdir -p /etc/ssl/private
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -subj "/C=BE/ST=BRUSSELS/L=UCCLE/O=19school"

#Create user
RUN adduser -D artainmo #Create user and password to be able to connect to ftps
RUN echo "artainmo:pass123" | chpasswd #The chpasswd command reads a list of user name and password pairs from standard input and uses this information to update a group of existing users

EXPOSE 21 30000 30001 30002 30004
#Port 21 is for the ftps platform and is the default ftp port
#All the other ports are for passive-mode downloads on ftps

CMD telegraf & /usr/sbin/pure-ftpd -Y 2 -p 30000:30004 -P 192.168.99.133
#-p for minport:maxport
#-P for IP address
#-Y 2 -> Refuse non-ssl connections -> TLS connection should be established to be secure
