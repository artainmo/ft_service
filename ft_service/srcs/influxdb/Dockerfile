#InfluxDB is an open-source time series database. Being a time series database, it suits the intensive workloads of storing and retrieving time-based data like application metrics, system health metrics (CPU, Memory, Network, Disk) usage etc.

FROM alpine

RUN apk add influxdb

EXPOSE 8086

CMD influxdb -p 8086
