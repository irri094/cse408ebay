sudo apt install mysql-server

sudo mysql -u root

> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'ppassword';

sudo mysql -u root -pppassword

> create database ebaydb

sudo apt install libmysqlclient-dev python3-dev

pip3 install mysqlclient

python3 manage.py migrate

now ebaydb should contain some tables related to django
