```
sudo apt install mysql-server

sudo mysql -u root

mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'ppassword';

sudo mysql -u root -pppassword


sudo apt install libmysqlclient-dev python3-dev

pip3 install mysqlclient


mysql> create database ebaydb

python3 manage.py migrate

```

now ebaydb should contain some tables related to django
