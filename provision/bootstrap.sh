#!/usr/bin/env bash

apt-get update
apt-get install -y git
apt-get install -y nginx
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
echo "Configuring Nginx"
cp /var/www/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
 
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
 
rm -rf /etc/nginx/sites-available/default
 
service nginx restart > /dev/null