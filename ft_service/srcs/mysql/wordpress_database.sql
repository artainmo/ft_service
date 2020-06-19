CREATE DATABASE wordpress;
CREATE USER 'artainmo'@'localhost' IDENTIFIED BY 'pass123';
CREATE USER 'Geoffrey'@'localhost' IDENTIFIED BY 'pass456';
CREATE USER 'Louis'@'localhost' IDENTIFIED BY 'pass789';
GRANT ALL PRIVILEGES ON *.* TO 'artainmo'@'localhost' IDENTIFIED BY 'pass123';
