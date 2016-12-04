#
# Cookbook Name:: dploy2
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Cookbook Name:: dploy
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#recipe for updating the apt-cache,opscode now has a resource put in core

apt_update 'all platforms' do
  frequency 86400
  action :periodic
end
#making the resource cross platform
case node['platform_family']
when 'debian'
  pac = 'apache2'
when 'rhel'
  pac = 'httpd'
end

package "#{pac}" do
  action :install
end

service "#{pac}" do
  action [ :enable, :start]
end


package 'mysql-server' do
  action :install
end

include_recipe "hwk::mysqlinits"

%w{ php5 php5-mcrypt php5-gd php5-mysql}.each do |pkgname|
  package pkgname do
    action :install
  end
  `notifies :restart, "service["#{pac}"]", :immediately`
end
