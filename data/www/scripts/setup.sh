#!/usr/bin/env bash


## for composer

apt-get update
apt-get install sudo

useradd -m docker

usermod -G root docker

mkdir ~/.ssh
cp -rf /var/www/id_rsa ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa

mkdir /home/docker/.ssh
cp -rf /var/www/id_rsa /home/docker/.ssh/id_rsa
chmod 400 /home/docker/.ssh/id_rsa

ln -s /var/www ~/sites


## Pre add ssh keys
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
ssh-keyscan -H acquia.com >> ~/.ssh/known_hosts

ssh-keyscan -H keys.gnupg.net >> ~/.ssh/known_hosts

ssh-keyscan -H repo.mongodb.org >> ~/.ssh/known_hosts

ssh-keyscan -H raw.githubusercontent.com >> ~/.ssh/known_hosts

ssh-keyscan -H hosting.acquia.com >> ~/.ssh/known_hosts
ssh-keyscan -H devcloud.hosting.acquia.com >> ~/.ssh/known_hosts
ssh-keyscan -H srv-3145.devcloud.hosting.acquia.com >> ~/.ssh/known_hosts

ssh-keyscan -H codeserver.dev.1baed054-bc5c-4781-9d8f-0fd08162f2f4.drush.in  >> ~/.ssh/known_hosts

ssh-keyscan -H drush.in  >> ~/.ssh/known_hosts

ssh-keyscan -H git.clarku.edu  >> ~/.ssh/known_hosts
ssh-keyscan -H clarku.edu  >> ~/.ssh/known_hosts
ssh-keyscan -H svn-11692.prod.hosting.acquia.com  >> ~/.ssh/known_hosts
ssh-keyscan -H acquia.com  >> ~/.ssh/known_hosts


ssh-keyscan -H svn-3086.devcloud.hosting.acquia.com >> ~/.ssh/known_hosts


ssh-keyscan -H svn-11692.prod.hosting.acquia.com >> ~/.ssh/known_hosts


ssh-keyscan -H *.devcloud.hosting.acquia.com >> ~/.ssh/known_hosts





## Git stuff - will config file this one day
cd /var/ && git config --global user.email "nick@eridesign.com"
cd /var/ && git config --global user.name "Nick Kuhn"
cd /var/ && git config --global core.editor "vim"
cd /var/ && git config --global core.filemode


mkdir /var/www/project

cd /var/www/project && git clone clarku@svn-11692.prod.hosting.acquia.com:clarku.git clarku

chmod -R 777 /var/www/project/clarku

git config --global core.filemode false && cd /var/www/project/clarku && git config core.filemode false



#cd /var/www/project/clarku && composer install --no-interaction --no-dev --prefer-dist


cp -rf /var/www/.drush  ~/
cp -rf /var/www/local.clarku.edu  /var/www/project/clarku/docroot/sites/





#mysql
echo "drop database clarku;" | mysql -uroot -h mysql
echo "create database clarku;" | mysql -uroot -h mysql


cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush @clarku.dev sql-dump > /var/www/dump.sql

mysql -u root -h mysql -p clarku --password="" < /var/www/dump.sql

cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush sqlq "create table field_data_field_show_header_bg (entity_type varchar(255), entity_id int, language varchar(255), deleted int, delta int);" 

cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush @none dl registry_rebuild-7.x-2.3 && drush rr

cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush upwd --password="admin" "kwall"



cd /var/www/project/clarku/docroot/sites/local.clarku.edu && drush cc all && drush en dblog -y
