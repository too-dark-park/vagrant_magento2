#!/usr/bin/env bash

apt-get  -y update
apt-get -y install nginx
service nginx start

if ! [ -l /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs vagrant/html/ /var/www/html
fi