package 'git' do
  action :install
end

execute 'clone-from-git' do
  command 'git clone "https://github.com/houami/drupal-site.git" "/var/www/html/drupal/"'
  not_if do ::File.directory?('/var/www/html/drupal') end
end


remote_file 'settings.php ' do
  path '/var/www/html/drupal/sites/default/settings.php'
  source "file:////var/www/html/drupal/sites/default/default.settings.php"
  owner "root"
  group "root"
  mode "0777"
end

remote_file 'services.yml' do
  path '/var/www/html/drupal/sites/default/services.yml'
  source "file:////var/www/html/drupal/sites/default/default.services.yml"
  owner "root"
  group "root"
  mode "0777"
end

directory '/var/www/html/drupal' do
  owner 'www-data'
  recursive true
end

directory '/var/www/html/drupal/sites/default/files' do
  mode "0777"
  recursive true
end
