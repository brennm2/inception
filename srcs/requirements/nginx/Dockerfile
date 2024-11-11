
# - Setting the base image for the nginx
FROM debian:bullseye
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y nginx

# - Setting up the SSL certificate for the nginx
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/nginx.key -x509 -days 365 -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=PT/ST=Porto/L=Porto/O=42Porto/OU=42Porto/CN=bde-souz.42.fr"


COPY ./conf/default.conf /etc/nginx/conf.d/ng.conf
CMD [ "nginx", "-g", "daemon off;" ]


