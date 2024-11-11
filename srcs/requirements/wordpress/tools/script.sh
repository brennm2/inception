#!/bin/bash
echo -e "\e[32mWaiting for MariaDB to initialize...\e[0m"
sleep 5

cd /var/www/html

# - Check if WordPress is already installed
if [ -f "wp-config.php" ]; then
    echo -e "\e[34mWordPress is already installed.\e[0m"
    echo -e "WPRESS_SECOND_USER=${WPRESS_SECOND_USER}"
    echo -e "WPRESS_SECOND_EMAIL=${WPRESS_SECOND_EMAIL}"
    echo -e "WPRESS_SECOND_PASSWORD=$(head -n 1 ${WPRESS_SECOND_PASSWORD})"
else
    # - Install WordPress using WP-CLI
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar

    # - change the default values
    ./wp-cli.phar core download --allow-root

    ./wp-cli.phar config create --dbname="${DATABASE_NAME}" \
                                --dbuser="${DATABASE_USER}" \
                                --dbpass="$(head -n 1 ${DATABASE_PASSWORD})" \
                                --dbhost="${DATABASE_HOST}" \
                                --allow-root

    ./wp-cli.phar core install --url="${WPRESS_URL}" \
                               --title="${WPRESS_TITLE}" \
                               --admin_user="${WPRESS_ADMIN}" \
                               --admin_password="$(head -n 1 ${WPRESS_ADMIN_PASSWORD})" \
                               --admin_email="${WPRESS_ADMIN_EMAIL}" \
                               --allow-root
  

    ./wp-cli.phar user create ${WPRESS_SECOND_USER} \
                              ${WPRESS_SECOND_EMAIL} \
                              --role=contributor \
                              --user_pass="$(head -n 1 ${WPRESS_SECOND_PASSWORD})" \
                              --allow-root 
fi

exec php-fpm7.4 -F
