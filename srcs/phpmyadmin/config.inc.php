<?php
//This file only contains the values that you want to change from the default values

//https://docs.phpmyadmin.net/en/latest/config.html

//server connection settings => Connect phpmyadmin with mysql
//cfg => config
//Servers -> server
//1 -> first and only server

$cfg['Servers'][1]['host'] = "mysql";
$cfg['Servers'][1]['port'] = "3306";
#$cfg['Servers'][1]['ssl'] = true
#$cfg['Servers'][1]['ssl_key'] = '/etc/nginx/ssl/user.pem'
#$cfg['Servers'][1]['ssl_cert'] = '/etc/nginx/ssl/user.key'

?>
