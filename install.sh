# install apache
apt -y install apache2
apt -y install libapache2-mod-php7.0
a2enmod rewrite
a2enmod php7.0

# install mysql
apt -y install mysql-server php7-mysql

# install php
apt -y install php7.0

# install composer
apt -y install composer

# install npm
apt -y install npm
ln -s /usr/bin/nodejs /usr/bin/node

apt -y install php7.0-bcmath php7.0-fpm php7.0-mcrypt php7.0-bz2 php7.0-gd php7.0-mysql php7.0-soap php7.0-cgi php7.0-gmp php7.0-odbc php7.0-sqlite3 php7.0-cli php7.0-imap php7.0-opcache php7.0-sybase php7.0-common php7.0-interbase php7.0-pgsql php7.0-tidy php7.0-curl php7.0-intl php7.0-phpdbg php7.0-xml php7.0-dba php7.0-json php7.0-pspell php7.0-xmlrpc php7.0-dev php7.0-ldap php7.0-readline php7.0-xsl php7.0-enchant php7.0-mbstring php7.0-recode php7.0-zip

# install gulp
npm install gulp-cli -g
npm install gulp -D

# set rights to /var/www
adduser $USER www-data
chown $USER:www-data -R /var/www
chmod 775 -R /var/www

# set apache conf for localhost
/bin/cp 000-default.conf /etc/apache2/sites-enabled

# restart apache
service apache2 restart


