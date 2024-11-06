FROM debian:bullseye
RUN apt-get update
RUN apt-get -y upgrade 
RUN apt-get install -y mariadb-server


COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /etc/mysql/.
COPY script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

#EXPOSE 3306

CMD [ "./script.sh" ]