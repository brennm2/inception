#!/bin/bash

#service mysql start
#mysql_install_db
mysqld
mysqld -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysqld -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysqld -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysqld -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysqld -e "FLUSH PRIVILEGES;"
mysqldadmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe
