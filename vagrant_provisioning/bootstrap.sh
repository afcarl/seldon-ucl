#!/usr/bin/env bash

echo "Provisioning Seldon UCL data cleaning server"

mkdir -p /vagrant/logs
chown vagrant:vagrant /vagrant/logs
mkdir -p /vagrant/flaskApp/cache
chown vagrant:vagrant /vagrant/flaskApp/cache
mkdir -p /vagrant/flaskApp/temp
chown vagrant:vagrant /vagrant/flaskApp/temp

echo "Setting up nginx..."
service nginx stop > /dev/null
rm /etc/nginx/nginx.conf > /dev/null
ln -s /vagrant/vagrant_provisioning/nginx/nginx.conf /etc/nginx/nginx.conf > /dev/null

echo "Setting up Supervisor daemons..."
ln -s /vagrant/vagrant_provisioning/supervisor/celery.conf /etc/supervisor/conf.d/celery.conf > /dev/null 2>&1
ln -s /vagrant/vagrant_provisioning/supervisor/gunicorn.conf /etc/supervisor/conf.d/gunicorn.conf > /dev/null 2>&1