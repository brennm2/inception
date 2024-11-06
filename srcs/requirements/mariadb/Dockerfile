FROM debian:bullseye
RUN apt-get update
RUN apt-get -y upgrade 
RUN apt-get install -y mariadb-server


COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
#RUN chmod 777 /var/lib/mysql/aria_log_control
#COPY init.sql /etc/mysql/.
COPY script.sh .

EXPOSE 3306


# RUN mkdir /run/mysqld
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
RUN chmod 755 /run/mysqld 
RUN chmod +x script.sh

#EXPOSE 3306

CMD [ "./script.sh" ]