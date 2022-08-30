##FROM php:8.1-apache-buster
##syntax=docker/dockerfile:experimental
#FROM php:7.4-apache
#
#RUN apt update -y
#
#ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
#
#RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
#    install-php-extensions zip
#
#RUN a2enmod headers rewrite
#
#ENV APACHE_DOCUMENT_ROOT /var/www/html/public
#RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
#RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
#
#WORKDIR /var/www/html
#
#COPY --chown=www-data . /var/www/html/
#
#COPY static/ /var/www/html
#
#RUN rm -rf /var/www/html/index.html

#FROM richarvey/nginx-php-fpm
#COPY static/ /var/www/html


FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apache2
RUN apt-get install -y php
RUN apt-get install -y php-dev
RUN apt-get install -y php-mysql
RUN apt-get install -y libapache2-mod-php
RUN apt-get install -y php-curl
RUN apt-get install -y php-json
RUN apt-get install -y php-common
RUN apt-get install -y php-mbstring

RUN rm -rfv /etc/apache2/sites-enabled/*.conf
RUN ln -s /etc/apache2/sites-available/slc.conf /etc/apache2/sites-enabled/slc.conf

COPY static/ /var/www/html

CMD ["apachectl","-D","FOREGROUND"]
RUN a2enmod rewrite
EXPOSE 80
EXPOSE 443
EXPOSE 8080
