#Is an http and reverse proxy server
FROM alpine

RUN apk update && apk add openssl && apk add nginx && apk add openssh && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
#apk -> Alpine Linux package manager, add -> Add new packages or upgrade packages to the running system

RUN mkdir /www
COPY index.html /www
#Sets the home page

RUN adduser -D user
#Creation of user linked with nginx.conf, -D means default

RUN rm /etc/nginx/nginx.conf #Deleting the default and putting own
COPY nginx.conf	/etc/nginx/

#Setting ssl on nginx
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/user.pem -keyout /etc/nginx/ssl/user.key -subj "/C=BE/ST=Bxl/L=Bruxelles/O=s19/OU=artainmo/CN=ft_services"

#Create telegraf config file, cpu and mem reads input from cpu and memroy usage and sends it to influxdb.
RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default loaction for configuration file telegraf
RUN mkdir -p /etc/telegraf
RUN mv telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 80 443
#Expose the ports, 80 is in http and redirects through 301 to 443. 443 is in https (https is encrypted using ssl while http is not) !!!!

RUN nginx -t
#Test the .conf file

CMD telegraf && nginx -g "daemon off;"
#Launch telegraf and nginx
#CMD in docker; There can only be one CMD command in docker, it provides defaults for an executing container, can contain any executable

#Difference between RUN and CMD. RUN runs the command and commits the result, while CMD doe snot execute anything at build time but specifies the intended command for the image.
