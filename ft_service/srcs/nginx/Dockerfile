FROM alpine

RUN apk add openssl \
&& apk add nginx
#apk -> Alpine Linux package manager, add -> Add new packages or upgrade packages to the running system

RUN adduser -D www
#Creation of user linked with nginx.conf

RUN mkdir /www
COPY index.html /www
#Sets the home page
RUN mkdir -p /run/nginx
#-p for all permissions on

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf	/etc/nginx/
#Set the new nginx.conf

RUN mkdir /etc/nginx/ssl \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/www.pem -keyout /etc/nginx/ssl/www.key -subj "/C=BE/ST=Bxl/L=Bruxelles/O=s19/OU=aglorios/CN=ft_services"

EXPOSE 80 443
#Expose the ports, 443 port is for https or ssl

RUN nginx -t
#Test if everything functions correctly

CMD nginx -g "daemon off;"
#Launch

#docker build --tag img . (tag to give a name to the created image)
#docker run -i -d -p 443:443 -p 80:80 img (run to create a container, -i to keep interactive, -d run in background)
#See docker ps
#See result on local port http://127.0.0.1/
#Docker kill to kill the container and system prune to kill all images
