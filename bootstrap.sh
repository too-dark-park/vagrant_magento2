#!/usr/bin/env bash

add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y php7.2 php7.2-zip php-xml composer

sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

apt-get -y update
apt-get -y install nginx
service nginx start

if ! [ -l /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs vagrant/html/ /var/www/html
fi