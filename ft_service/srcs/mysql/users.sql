CREATE DATABASE wordpress;
CREATE USER 'artainmo'@'localhost' IDENTIFIED BY 'pass123';
CREATE USER 'david'@'localhost' IDENTIFIED BY 'pass345';
CREATE USER 'Louis'@'localhost' IDENTIFIED BY 'pass567';
GRANT ALL PRIVILEGES ON *.* TO 'artainmo'@'localhost' IDENTIFIED BY 'pass123';
