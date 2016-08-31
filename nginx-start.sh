#!/bin/bash

mkdir -p /data/logs
chown -R www-data /data/logs

#With thanks to dylanlindgren
cp /opt/etc/nginx.conf /etc/nginx/nginx.conf

if [ -z "$PHPFPM_PORT_9000_TCP_ADDR" ]
then
  sed -i "s/%fpm-ip%/$PHPFPM_1_PORT_9000_TCP_ADDR/" /etc/nginx/nginx.conf
else
  sed -i "s/%fpm-ip%/$PHPFPM_PORT_9000_TCP_ADDR/" /etc/nginx/nginx.conf
fi
sed -i "s/LARAVEL_SERVER_NAME/$LARAVEL_SERVER_NAME/g" /etc/nginx/sites-available/laravel


exec /usr/sbin/nginx
