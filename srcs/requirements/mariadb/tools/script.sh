#!/bin/bash

# Start the mysql daemon
mysql_install_db
exec mysqld --socket=/run/mysqld/mysqld.sock --user=root --console
