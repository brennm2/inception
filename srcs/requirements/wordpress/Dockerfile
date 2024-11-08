# - Setting the base image for the wordpress
FROM debian:bullseye
RUN apt-get update
RUN apt-get -y upgrade 
RUN apt-get -y install curl
RUN apt-get -y install php7.4-fpm
RUN apt-get -y install php-mysqli

# - Making the directory for the wordpress
RUN mkdir /run/php

# - Copying the configuration file and script for the wordpress
COPY ./conf/www.conf etc/php/7.4/fpm/pool.d/.
COPY ./tools/script.sh .

# - Changing the permission of the script
RUN chmod +x script.sh

# - Exposing the port for the wordpress
EXPOSE 9000

# - Running the script
CMD ["./script.sh"]