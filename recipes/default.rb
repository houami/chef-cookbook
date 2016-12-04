#
# Cookbook Name:: hwk
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#install apache mysql-server php with dependent packages too
include_recipe "hwk::install_amp"
include_recipe "hwk::drupal_git"
include_recipe "hwk::mysql_dump"
include_recipe "hwk::masterslave"
