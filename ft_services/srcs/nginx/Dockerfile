FROM alpine

RUN apk update && apk add openssl && apk add nginx && apk add openssh
#apk -> Alpine Linux package manager, add -> Add new packages or upgrade packages to the running system

RUN mkdir /www
COPY index.html /www
#Sets the home page
RUN mkdir -p /run/nginx
#-p Creates necessary intermediate directories, gives all the permissions and shows no error if the directory already exist

RUN adduser -D www
#Creation of user linked with nginx.conf (-D??Directory?)

RUN rm /etc/nginx/nginx.conf #Deleting the default and putting own
COPY nginx.conf	/etc/nginx/

RUN mkdir /etc/nginx/ssl \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/www.pem -keyout /etc/nginx/ssl/www.key -subj "/C=BE/ST=Bxl/L=Bruxelles/O=s19/OU=artainmo/CN=ft_services"

EXPOSE 80 443
#Expose the ports, 80 is in http and redirects through 301 to 443. 443 is in https (https is encrypted using ssl while http is not) !!!!

RUN nginx -t
#Test if everything functions correctly

CMD nginx -g "daemon off;"
#Launch
#CMD in docker; There can only be one CMD command in docker, it provides defaults for an executing container, can contain any executable

#Difference between RUN and CMD. RUN runs the command and commits the result, while CMD doe snot execute anything at build time but specifies the intended command for the image.
