FROM debian:bullseye
# Update and install prerequisites
RUN apt-get update
RUN apt-get -y upgrade 
#RUN apt-get install -y lsb-release apt-transport-https ca-certificates curl

# Add the PHP repository to get PHP 8.3 packages
#RUN curl -sSL https://packages.sury.org/php/README.txt | bash

# Install PHP 8.3 and PHP-FPM
#RUN apt-get update && \
RUN apt-get install -y php7.4-fpm
RUN apt-get install -y php7.4-mysqli
RUN apt-get install -y curl

# Create the /run/php directory for the socket file
RUN mkdir -p /run/php

COPY www.conf /etc/php/7.4/fpm/pool.d/.
COPY script.sh .


RUN chmod +x script.sh

#EXPOSE 9000

# Set the command to start PHP-FPM
CMD ["./script.sh"]