sudo apt-get -y update
sudo apt-get -y install apache2
sudo apt-get -y install git

sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
# LAMP
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql

# Instalación de PHP
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt

sudo mysql_install_db
sudo mysql_secure_installation
# MYSQL
sudo rm -rf /var/www/sitio1
sudo rm -rf /var/www/sitio2
sudo rm -rf /var/www/index.html
#clonar las paginas de ejemplo
git clone https://github.com/Franpastoragusti/sitio1.git /var/www/sitio1
git clone https://github.com/Franpastoragusti/sitio2.git /var/www/sitio2

#movemos los archivos de configuracion al apache
sudo mv /var/www/sitio1/sitio1.conf /etc/apache2/sites-available/sitio1.conf
sudo mv /var/www/sitio2/sitio2.conf /etc/apache2/sites-available/sitio2.conf

cd /etc/apache2/sites-available/
sudo a2ensite sitio1.conf
sudo a2ensite sitio2.conf
sudo a2dissite default
sudo service apache2 reload
