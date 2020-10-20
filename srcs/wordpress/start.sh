until php-fpm7 #php-fpm is a service that reads for the fastCGI server the php code
do
	echo "waiting for php-fpm7"
done

nginx -g "daemon off;" #& telegraf
