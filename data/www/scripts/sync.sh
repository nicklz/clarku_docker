#!/usr/bin/env bash


#mysql
echo "drop database clarku;" | mysql -uroot -h mysql
echo "create database clarku;" | mysql -uroot -h mysql


cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush @clarku.dev sql-dump > /var/www/dump.sql

mysql -u root -h mysql -p clarku --password="" < /var/www/dump.sql

cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush sqlq "create table field_data_field_show_header_bg (entity_type varchar(255), entity_id int, language varchar(255), deleted int, delta int);"

cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush @none dl registry_rebuild-7.x-2.3 && drush rr

cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush upwd --password="admin" "kwall"



cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush cc all && drush en dblog -y



#files
#cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush rsync @clarku.prod:%files @clarku.local:%files -y
#cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush cc all
