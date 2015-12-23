#!/bin/bash

# gnu screen
yum -y install screen

# ansible
yum -y install ansible

# nginx
cp {template,}/etc/yum.repos.d/nginx.repo
wget -O /tmp/nginx_signing.key http://nginx.org/keys/nginx_signing.key
rpm --import /tmp/nginx_signing.key

yum -y install nginx

cp {template,}/etc/nginx/nginx.conf
cp {template,}/etc/nginx/conf.d/packagist.jp.conf
mkdir -p /var/www/vhost/packagist.jp

sudo service nginx restart

# php
wget -O /tmp/remi-release-6.rpm http://remi.kazukioishi.net/enterprise/remi-release-6.rpm
rpm -Uvh /tmp/remi-release-6.rpm

yum -y install \
    php70-php-cli \
    php70-php-process \
    php70-php-pdo \
    php70-php-pecl-zip


