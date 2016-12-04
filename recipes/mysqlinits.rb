#setting debian configuration that may be asked during installation
bash 'sql init' do
  code <<-EOH
    export DEBIAN_FRONTEND="noninteractive"
    sudo /usr/bin/debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
    sudo /usr/bin/debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
      EOH
end

execute ".my.cnf" do
  command 'sudo cp /etc/mysql/debian.cnf /root/.my.cnf'
  not_if do ::File.exist?('/root/.my.cnf') end
end

cookbook_file '/tmp/sqls.sh' do
  source "sqls.sh"
  mode "0777"
end

execute 'run the bash script' do
  command "su -c /tmp/sqls.sh root"
end
