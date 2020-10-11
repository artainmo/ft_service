<?php
//This file only contains the values that you want to change from the default values

//https://docs.phpmyadmin.net/en/latest/config.html

//server connection settings => Connect phpmyadmin with mysql
//cfg => config
//Servers -> server
//1 -> first and only server

$cfg['Servers'][1]['host'] = "mysql-service";
$cfg['Servers'][1]['port'] = "3306";
$cfg['Servers'][1]['user'] = "user";
$cfg['Servers'][1]['password'] = "pass123";

?>
