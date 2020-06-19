FROM alpine

#Download phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN rm phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mkdir /www
RUN mv phpMyAdmin-4.9.0.1-all-languages/* /www
RUN mkdir -p /run/phpMyadmin

EXPOSE 5000

CMD php -S 0.0.0.0:5000 -t /www/
#Command to easily build web server hosting phpmyadmin
#CMD for a shell command with multiple parameters
#php to launch php code
# -S to start built-in web server on the given local address and port
#php [options] -S addr:port [-t docroot]
