#InfluxDB is an open-source time series database. Being a time series database, it suits the intensive workloads of storing and retrieving time-based data like application metrics, system health metrics (CPU, Memory, Network, Disk) usage etc.
#InfluxDB should be connected to grafana, grafana has an influxDB database

FROM alpine

RUN apk update && apk add influxdb

EXPOSE 8086 // This is the default port for InfluxDB

CMD influxdb -p 8086 //Trying to launch the influxDB database
