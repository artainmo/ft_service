<?php
//This file only contains the values that you want to change from the default values

//https://docs.phpmyadmin.net/en/latest/config.html

//server connection settings => Connect phpmyadmin with mysql
//cfg => config
//Servers -> server
//1 -> first and only server
cfg['Servers']['1']['host'] = 'mysql-service' //Defined in .yalm
cfg['Servers']['1']['port'] = '3306' //Same as default value but still kept for clarity
cfg['Servers']['1']['user'] = 'artainmo' //Defined in user.sql
cfg['Servers']['1']['password'] = 'pass123' //Defined in user.sql


// cfg['server']['1']['AllowNoPassword'] = true //Activate this line to allow acces to mysql without password

?>
