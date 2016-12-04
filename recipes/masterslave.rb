cookbook_file '/etc/mysql/my.cnf' do
  source "my.cnf"
  owner 'root'
  mode '0755'
end

#restart mysql service after modifying the configurations
execute 'refresh mysql' do
  command 'sudo service mysql restart'
end

cookbook_file '/tmp/master.sh' do
  source "masterslavee.sh"
  mode "0755"
  owner "root"
end

execute 'run the bash script' do
  command "su -c /tmp/master.sh root"
end
