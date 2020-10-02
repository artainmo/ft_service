#Grafana is an online dashboard to visualize the data collected by influxdb
#https://grafana.com/grafana/download

FROM Alpine

RUN apk update && apk add --no-cache bash && apk add wget && apk add --repository https://pkgs.alpinelinux.org/package/edge/testing/x86_64/grafana --allow-untrusted && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

#Get tar file grafana
RUN wget https://dl.grafana.com/oss/release/grafana-6.7.2.linux-amd64.tar.gz
#x for extract archive, v verbal display info, f use archive file
RUN tar -xvf grafana-6.7.2.linux-amd64.tar.gz
RUN rm grafana-6.7.2.linux-amd64.tar.gz

#Set for the corection the grafana.db file for demanded grafana dashboard configurations like connection with influxdb
RUN mkdir -p grafana-6.7.2/data
COPY grafana.db grafana-6.7.2/data/
#To provide an already-configured version of Grafana, setup a blank Grafana setup, launch your container, configure everything on online dashboard.
#Then save the grafana.db file on your computer (you can use "kubectl cp" to get data from a running pod). You can now copy this file in your container.
#grafana.db will be found in /data


#Create telegraf config file, cpu and mem reads input from cpu and memory usage and sends it to influxdb.
RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default location for configuration file telegraf
RUN mkdir -p /etc/telegraf
RUN mv telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3000 // This is the default port for InfluxDB

CMD telegraf && ./grafana-6.7.2/bin/grafana-server web
#https://grafana.com/docs/grafana/latest/installation/debian/
#Start grafana by executing the binary grafana-server on linux with web argument
