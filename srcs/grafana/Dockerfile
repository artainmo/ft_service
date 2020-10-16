#Grafana is an online dashboard to visualize the data collected by influxdb, that got data from telegraf
#default user and password admin:admin -> can be changed on platform with grafana.db

FROM alpine

RUN apk update && apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

#Install telegraf with conf towards influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

#Config grafana dashboards
COPY grafana.db /usr/share/grafana/data/grafana.db
#Configure grafana on web dashboard, this will generate in pod a grafana.db file
#Use kubectl cp grafana-6884f544c7-pxl4p:/usr/share/grafana/data/grafana.db grafana.db to get the grafana.db
#Now grafana.db can directly be used at startup

EXPOSE 3000

CMD telegraf & usr/sbin/grafana-server --homepath "/usr/share/grafana"
#grafana-server is the back-end server, is a binary, execute it in container to debug and find homepath
# & launches two commands while && waits for first one to finish

#Configure online dashboard:
#First add influxd datasource -> http://influxdb:8086 (url) + default parameters and names
#Then create dashboard, name it and select correct query (just created datasource) after select mem -> available (available memory) and on second panel cpu -> usage system (working processes)
#Potentially change password and name
