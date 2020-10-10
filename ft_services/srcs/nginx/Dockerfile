#Is an http and reverse proxy server
#https://www.cyberciti.biz/faq/how-to-install-nginx-web-server-on-alpine-linux/
#https://linuxhint.com/install_get_started_nginx/
FROM alpine

RUN apk update && apk add openssl && apk add nginx && apk add openssh #&& apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
#apk -> Alpine Linux package manager, add -> Add new packages or upgrade packages to the running system


#Creation of user linked with nginx.conf, -D means default
RUN adduser -D nginx_user

#Gives correct files system permissions and sets the nginx directory and home page
RUN mkdir /www
COPY index.html /www
#RUN chown -R nginx_user:nginx_user www/*
#Gives permission to the nginx user
#RUN chmod -R 755 www/*
#Makes files accessible, -R means hierarchical files too
RUN mkdir -p run/nginx/
#Last command is demanded by "nginx -t" config file test, to create nginx.pid file

#Deleting the default configuration file and putting own
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf	/etc/nginx/

#Setting ssl on nginx
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/user.pem -keyout /etc/nginx/ssl/user.key -subj "/C=BE/ST=Bxl/L=Bruxelles/O=s19/OU=artainmo/CN=ft_services"

#SSH is used to access computer remotely through a shell
#Provide ssh connection by generating host keys and running the sshd deamon
#RUN adduser -D ssh_user (seems to be recommended but not sure if necessary)
RUN ssh-keygen -A
#ssh-keygen is a tool for creating new authentication key pairs for SSH, if not generated host key error occurs. -A default key creation towards default path (etc/ssh)

#Create telegraf config file, cpu and mem reads input from cpu and memory usage and sends it to influxdb.
#RUN telegraf config --output-filter influxdb > telegraf.conf
#Create default location for configuration file telegraf
#RUN rm -rf etc/telegraf.conf.d etc/telegraf.conf
#RUN mkdir etc/telegraf
#RUN mv telegraf.conf etc/telegraf/telegraf.conf

EXPOSE 80 443 22
#Expose the ports, 80 is in http and redirects through 301 to 443. 443 is in https (https is encrypted using ssl while http is not) !!!!
#22 is the default ssh port

RUN nginx -t
#Test the .conf file

CMD /usr/sbin/sshd && nginx -g "daemon off;" #&& telegraf
#Launch shh deamon, telegraf and nginx

#Difference between RUN and CMD. RUN runs the command and commits the result, while CMD doe snot execute anything at build time but specifies the intended command for the image.
