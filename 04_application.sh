#!/bin/sh
git clone git://github.com/hirak/packagist-crawler.git /opt/packagist-crawler
cd /opt/packagist-crawler

wget -O composer.phar https://getcomposer.org/composer.phar
composer='php70 -dallow_url_fopen=1 -dzend.enable_gc=0 /opt/packagist-crawler/composer.phar'

$composer install -o
$composer config -g github-oauth.github.com 70ae7f3991939e7210c657bc8dca16841255bc1c

cd -

cp {temlate,}/opt/packagist-crawler/config.php

crontab < crontab
