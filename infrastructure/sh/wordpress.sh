#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y apache2 php8.1 libapache2-mod-php php8.1-mysql php8.1-xml php8.1-curl php8.1-gd php8.1-imagick
sudo systemctl enable apache2
sudo systemctl start apache2
sudo apt install -y wget
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODaHqtrCOBpfD+meWggDG5gFEqnNDtpxnqQ7xWIfXfL cloud-wordpress" >> ~/.ssh/authorized_keys
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo cp wordpress/wp-config-sample.php wordpress/wp-config.php
cat <<EOT >> /credfile.txt
define( 'AS3CF_SETTINGS', serialize( array (
    'provider' => 'aws',
    'access-key-id' => '${access_key}',
    'secret-access-key' => '${secret_key}',
    'bucket' => '${s3_bucket_name}',
    'region' => '${s3_bucket_region}',
    'copy-to-s3' => true,
    'serve-from-s3' => true,
    'force-https' => true,
    'remove-local-file' => true,
) ) );
EOT
sudo sed -i "/define( 'WP_DEBUG', false );/r /credfile.txt" wordpress/wp-config.php
sudo sed -i "s/database_name_here/${database_name}/" wordpress/wp-config.php
sudo sed -i "s/username_here/${database_user}/" wordpress/wp-config.php
sudo sed -i "s/password_here/${database_pass}/" wordpress/wp-config.php
sudo sed -i "s/localhost/${private_ip}/" wordpress/wp-config.php

sudo wget -qO /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x /usr/local/bin/wp
until sudo -u www-data wp core install \
    --path="wordpress" \
    --url="${wordpress_public_ip}" \
    --admin_user="${admin_user}" \
    --admin_password="${admin_pass}" \
    --admin_email="example@example.com" \
    --title="Cloud" \
    --skip-email; do
        echo "Error establishing a database connection. Retrying...";
        sleep 5;
    done

sudo wp plugin install amazon-s3-and-cloudfront --path="wordpress" --allow-root --activate
cp -r wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www
sudo chmod -R 755 /var/www
sudo systemctl restart apache2