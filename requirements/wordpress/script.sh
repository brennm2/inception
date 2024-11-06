#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root



php-fpm7.4 -F

# #!/bin/bash

# # Navigate to the web directory
# cd /var/www/html

# # Install WP-CLI
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod 777 wp-cli.phar

# # Download WordPress core
# ./wp-cli.phar core download --allow-root

# # Create the WordPress config
# ./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root

# # Install WordPress
# ./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

# # Start PHP-FPM in the background (run as a service or background process)
# php-fpm8.3 -F &

# # Optionally, you can also start Nginx here, if it's part of the setup
# # service nginx start  # Uncomment if needed
