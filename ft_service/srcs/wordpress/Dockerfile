FROM alpine

#Get wordpress through zip
RUN wget https://wordpress.org/latest.tar.gz
#x for extract archive, v verbal display info, f use archive file
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz
RUN mkdir -p /www
RUN mv wordpress /www
RUN mkdir -p /run/wordpress #???!!!!

EXPOSE 5050

#Command to easily build web server hosting wordpress
CMD php -S 0.0.0.0:5050 -t /www/wordpress
#CMD for a shell command with multiple parameters
#php to launch php code
# -S to start built-in web server on the given local address and port
#php [options] -S addr:port [-t docroot]
