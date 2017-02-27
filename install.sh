install apache
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

apt -y install php7.0-bcmath php7.0-fpm php7.0-mcrypt php7.0-bz2 php7.0-gd php7.0-mysql php7.0-soap php7.0-cgi php7.0-gmp php7.0-odbc php7.0-sqlite3 php7.0-cli php7.0-imap php7.0-opcache php7.0-sybase php7.0-common php7.0-interbase php7.0-pgsql php7.0-tidy php7.0-curl php7.0-intl php7.0-phpdbg php7.0-xml php7.0-dba php7.0-json php7.0-pspell php7.0-xmlrpc php7.0-dev php7.0-ldap php7.0-readline php7.0-xsl php7.0-enchant php7.0-mbstring php7.0-recode php7.0-zip php-xdebug

# configure xdebug
echo "[Xdebug]\nzend_extension=\"/usr/lib/php/20151012/xdebug.so\"\nxdebug.remote_enable=1\nxdebug.remote_handler=dbgp\nxdebug.remote_mode=req\nxdebug.remote_host=127.0.0.1\nxdebug.remote_port=9000\nxdebug.max_nesting_level=300\n" >> /etc/php/7.0/apache2/php.ini

# install gulp
npm install gulp-cli -g
npm install gulp -D

# install pixiu cli
wget https://bootstrap.pypa.io/get-pip.py
wget https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py

python3 get-pip.py
pip install virtualenv
python3 get-pipsi.py

rm *.py

cd ..
git clone git@github.com:pixiucz/cli.git
sudo -u $SUDO_USER sh -c "pipsi install --editable cli"
rm -rf cli
pipsi upgrade --editable cli
cd dev-setup

# set rights to /var/www
adduser $SUDO_USER www-data
chown $SUDO_USER:www-data -R /var/www
chmod 775 -R /var/www

# set apache conf for localhost
/bin/cp 000-default.conf /etc/apache2/sites-enabled

# restart apache
service apache2 restart


