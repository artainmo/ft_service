FROM alpine
ARG IP

#FTPS is based on the FTP potocol. FTP is a protocol that has one server and multiple clients, the clients connect to the server to transfer files from one system to another. FTPS uses ssl.
#Test ftp connection with: ftp <user>@<ip>
#https://www.pureftpd.org/project/pure-ftpd/
#https://download.pureftpd.org/pub/pure-ftpd/doc/README

#get FTPD (FTP deamon)
RUN apk update && apk add openssl && apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
#pure-ftpd is a free, secured version of ftp that works with ssl and that runs in background => what we need for ftps

#Create a specific, unprivileged user and group called _pure-ftpd, without any valid shell. Don't use this for anything else, including FTP virtual users. (recommended but optional)
RUN groupadd _pure-ftpd
RUN useradd -g _pure-ftpd -d /var/empty -s /etc _pure-ftpd

#Set ssl on pure-ftp protocol
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -subj "/C=BE/ST=BRUSSELS/L=UCCLE/O=19school"


#Create telegraf config file, cpu and mem reads input from cpu and memory usage and sends it to influxdb.
RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default location for configuration file telegraf
RUN mkdir -p /etc/telegraf
RUN mv telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21

CMD telegraf && pure-ftpd -p 21:21 -P IP #Trying to launch
#-p for minport:maxport
#-P for IP address
