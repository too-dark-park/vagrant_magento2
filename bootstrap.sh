#!/usr/bin/env bash

add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y php7.2 php7.2-xml php7.2-bcmath php7.2-curl php7.2-xmlwriter zip unzip php7.2-zip php7.2-gd php7.2-mysql php7.2-mbstring php7.2-intl php7.2-common php7.2-fpm php7.2-bz2 php7.2-dev php7.2-soap 

apt-get update

sudo apt-get install -y php7.2-cli curl > /dev/null
curl -Ss https://getcomposer.org/installer | php > /dev/null
sudo mv composer.phar /usr/bin/composer

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