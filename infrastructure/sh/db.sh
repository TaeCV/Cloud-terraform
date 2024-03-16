#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common -y
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
sudo bash mariadb_repo_setup --mariadb-server-version=10.6
sudo apt update
sudo apt install -y mariadb-server
sudo sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl status mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql -u root -e "CREATE USER '${database_user}'@'${private_ip}' IDENTIFIED BY '${database_pass}';"
sudo mysql -u root -e "CREATE DATABASE ${database_name};"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON ${database_name}.* TO '${database_user}'@'${private_ip}';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"
sudo systemctl restart mariadb

# Add SSH key to authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODaHqtrCOBpfD+meWggDG5gFEqnNDtpxnqQ7xWIfXfL cloud-wordpress" >> ~/.ssh/authorized_keys
