#InfluxDB is an open-source time series database. Being a time series database, it suits the intensive workloads of storing and retrieving time-based data like application metrics, system health metrics (CPU, Memory, Network, Disk) usage etc.
#InfluxDB should be connected to grafana, grafana has an influxDB database, telegraph should be used to collect data to influxB

FROM alpine

RUN apk update && apk add --no-cache bash && apk add influxdb && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

#Create telegraf config file, cpu and mem reads input from cpu and memroy usage and sends it to influxdb.
RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default location for configuration file telegraf
RUN mkdir -p /etc/telegraf
RUN mv telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8086 // This is the default port for InfluxDB

CMD telegraf && influxd -config /etc/influxdb/influxdb.conf
//Point the process to the correct configuration file by using the -config option
//Trying to launch the influxDB database and telegraf
