#!/bin/sh

export PATH=/usr/local/bin:$PATH

APP_ROOT=/var/www/apps/library

cd $APP_ROOT
bundle install --path=vendor/bundle

ln -sf $APP_ROOT/config/vhosts/development.conf /etc/httpd/vhosts.d/library.conf
ln -sf $APP_ROOT/config/vagrant/database.yml config

bundle exec rake db:setup

service httpd reload
