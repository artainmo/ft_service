FROM alpine
ARG IP

#FTPS is based on the FTP potocol. FTP is a protocol that has one server and multiple clients, the clients connect to the server to transfer files from one system to another. FTPS uses ssl.
#Test ftp connection with: ftp <user>@<ip>
#https://www.pureftpd.org/project/pure-ftpd/
#https://download.pureftpd.org/pub/pure-ftpd/doc/README

#get FTPD (FTP deamon)
RUN apk update && apk add openssl && apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
#pure-ftpd is a free, secured version of ftp that works with ssl and that runs in background => what we need for ftps


#Add user optional but recommended


#Set ssl on pure-ftp protocol
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -subj "/C=BE/ST=BRUSSELS/L=UCCLE/O=19school"


#Create telegraf config file, cpu and mem reads input from cpu and memory usage and sends it to influxdb.
RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default location for configuration file telegraf
RUN rm -rf etc/telegraf.conf.d etc/telegraf.conf
RUN mkdir etc/telegraf
RUN mv telegraf.conf etc/telegraf/telegraf.conf

EXPOSE 21

CMD telegraf && pure-ftpd -p 21:21 -P $IP #Trying to launch
#-p for minport:maxport
#-P for IP address
