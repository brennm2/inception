#!/bin/bash

#mysql_install_db
mysql_upgrade
exec mysqld --socket=/run/mysqld/mysqld.sock --user=root --console



# #service mysql start
# #mysql_install_db
# # echo sql teste $SQL_USER
# # echo database: $SQL_DATABASE


# mysqld  &
# sleep 5
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# exec mysqld_safe &
# #/usr/bin/mysqld  &
# sleep 10



