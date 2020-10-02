FROM alpine
ARG IP

#FTPS is based on the FTP potocol. FTP is a protocol that has one server and multiple clients, the clients connect to the server to transfer files from one system to another.

#get FTPD (FTP deamon)
RUN apk update && apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
#Use the alpine package with the --repository and constant alpine link

#Create telegraf config file, cpu and mem reads input from cpu and memroy usage and sends it to influxdb.
RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default location for configuration file telegraf
RUN mkdir -p /etc/telegraf
RUN mv telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21

CMD telegraf && pure-ftpd -p 21:21 -P $(IP) #Trying to launch
