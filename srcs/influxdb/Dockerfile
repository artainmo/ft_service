#InfluxDB is an open-source time series database. Being a time series database, it suits the intensive workloads of storing and retrieving time-based data like application metrics, system health metrics (CPU, Memory, Network, Disk) usage etc.
#InfluxDB should be connected to grafana, grafana has an influxDB database, telegraf should be used to collect data from containers to influxB

#telegraf needs to be configured, it should have a database name to be able to connect with grafana in the end. A default telegraf.conf is used with a modification on line 116 to declare the database name


FROM alpine

RUN apk update && apk add influxdb

#Install telegraf with conf towards influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8086

CMD telegraf & influxd run -config /etc/influxdb.conf
#Point the process to the correct configuration file by using the -config option, to launch influxdb
