#nginx is an http and reverse proxy server
#htmls (443) is a secured form of html (80) through data encryption
#SSH is used to access computer remotely through a shell, has default port 22
#https://www.cyberciti.biz/faq/how-to-install-nginx-web-server-on-alpine-linux/
#https://linuxhint.com/install_get_started_nginx/

FROM alpine

RUN apk update && apk add nginx openssl openssh

#Install telegraf with conf towards influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

#Config nginx
RUN adduser -D www; #Creation of user linked with nginx.conf, -D means default
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /run/nginx #Last command is demanded by "nginx -t" config file test, to create nginx.pid file

#Config ssl and ssh
RUN adduser -D artainmo #Create user and password to be able to connect to shh
RUN echo "artainmo:pass123" | chpasswd #The chpasswd command reads a list of user name and password pairs from standard input and uses this information to update a group of existing users
RUN mkdir /etc/nginx/ssl
RUN ssh-keygen -A #ssh-keygen is a tool for creating new authentication key pairs for SSH, if not generated host key error occurs. -A default key creation towards default path (etc/ssh)
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/user.pem -keyout /etc/nginx/ssl/user.key -subj "/C=BE/ST=Bxl/L=Bruxelles/O=s19/OU=artainmo/CN=ft_services" #generate ssl certificates for https

RUN nginx -t
#Check if config file is correct

EXPOSE 80 443 22

CMD telegraf & /usr/sbin/sshd && nginx -g "daemon off;"

#Launch shh deamon, telegraf and nginx
#-g to give directive of running in foreground

#Difference between RUN and CMD. RUN runs the command and commits the result, while CMD doe snot execute anything at build time but specifies the intended command for the image.
