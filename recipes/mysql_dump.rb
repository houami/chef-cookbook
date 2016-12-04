mysql_client 'default' do
  action :create
end

mysqldump '/home/vagrant/dumpfile.sql' do
  dbhost 'localhost'
  dbuser 'drupaluser'
  dbpassword 'drupalpass'
  dbname 'drupal_db'
  overwrite true
end
