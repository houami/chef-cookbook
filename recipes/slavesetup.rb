package 'mysql-server' do
  action :install
end

cookbook_file '/etc/mysql/my.cnf' do
  source "smy.cnf"
  owner "root"
  mode "0755"
end

cookbook_file '/tmp/slave.sh' do
  source "slave.sh"
  mode "0755"
  owner "root"
end

execute 'run the bash script' do
  command "su -c /tmp/slave.sh root"
end
