# - Setting up the docker image for the mariadb
FROM debian:bullseye
RUN apt-get update
RUN apt-get -y upgrade 
RUN apt-get install -y mariadb-server


# - Copying the configuration files
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/init.sql /etc/mysql/.
COPY ./tools/script.sh .

# - Setting correct permissions for the configuration file
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

# - Setting up the mysql and running the script
RUN mkdir /run/mysqld
RUN chmod +x script.sh

# - Exposing the 3306 port
EXPOSE 3306


CMD [ "./script.sh" ]