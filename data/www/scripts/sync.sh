#!/usr/bin/env bash


#mysql
echo "drop database clarku;" | mysql -uroot -h mysql
echo "create database clarku;" | mysql -uroot -h mysql


cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush @clarku.dev sql-dump > /var/www/dump.sql

mysql -u root -h mysql -p clarku --password="" < /var/www/dump.sql

cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush cc all && drush en dblog -y
cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush en clarku_updates -y



#files
#cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush rsync @clarku.prod:%files @clarku.local:%files -y
#cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush cc all
