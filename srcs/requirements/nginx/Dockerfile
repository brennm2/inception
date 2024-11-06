FROM debian:bullseye
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y nginx


# -- Install openssl
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=PT/L=Porto/O=42/OU=student/CN=bde-souz.42.fr/UID=bde-souz"

RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY conf/default /etc/nginx/sites-available/.
CMD [ "nginx", "-g", "daemon off;" ]


