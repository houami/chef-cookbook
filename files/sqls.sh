mysql -e "CREATE DATABASE drupal_db;"
mysql -e "GRANT ALL PRIVILEGES ON drupal_db.* TO drupaluser@'localhost' identified by 'drupalpass';"
mysql -e "FLUSH PRIVILEGES;"
