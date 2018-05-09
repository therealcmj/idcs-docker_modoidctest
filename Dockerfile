
FROM php:apache
MAINTAINER Chris Johnson (christopher.johnson@oracle.com)


RUN apt-get -y update
RUN apt-get -y install libapache2-mod-auth-openidc
run a2enmod auth_openidc

COPY auth_openidc.conf /etc/apache2/mods-enabled
COPY html/ /var/www/html/

#FROM httpd:2.4
#COPY ./public-html/ /usr/local/apache2/htdocs/
