#!/bin/bash
apt-get -y update

# install Apache2
apt-get -y install apache2 

# write some HTML
echo hostname > /var/www/html/demo.html

# restart Apache
apachectl restart