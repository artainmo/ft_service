#Initializes the database and creates the default tables, wordpress tables are used to categorize databases
#Root is the default user
mysql_install_db --user=root --ldata=/var/lib/mysql

#Creation of users.sql file with sql commands to create a database and users
cat > /tmp/users.sql << end
CREATE DATABASE wordpress;
CREATE USER 'artainmo'@'%' IDENTIFIED BY 'pass123';
GRANT ALL PRIVILEGES ON *.* TO 'artainmo'@'%' IDENTIFIED BY 'pass123' WITH GRANT OPTION;
FLUSH PRIVILEGES;
end

telegraf & /usr/bin/mysqld --init_file=/tmp/users.sql
#mysqld is the mysql server in binary that has to be executed to launch a mysql server
#init_file is a global variable that when defined executes at startup the sql commands inside the specified file
