FROM dylanlindgren/docker-laravel-nginx

RUN rm -rf /etc/nginx/sites-available/laravel
#RUN sed -i 's/\(include \/etc\/nginx\/sites-enabled\/\*;\)/\1\n include \/data\/*.conf;/g' /etc/nginx/nginx.conf

ADD laravel /etc/nginx/sites-available/
ADD nginx-start.sh /opt/bin/nginx-start.sh
RUN chmod u=rwx /opt/bin/nginx-start.sh
