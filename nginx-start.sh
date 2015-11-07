#!/bin/bash

#With thanks to dylanlindgren
cp /opt/etc/nginx.conf /etc/nginx/nginx.conf
sed -i "s/%fpm-ip%/$FPM_PORT_9000_TCP_ADDR/" /etc/nginx/nginx.conf
sed -i "s/LARAVEL_SERVER_NAME/$LARAVEL_SERVER_NAME/g" /etc/nginx/sites-available/laravel
exec /usr/sbin/nginx
