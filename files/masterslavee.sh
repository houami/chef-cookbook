mysql -e "GRANT REPLICATION SLAVE ON %.* TO 'slave_user'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "FLUSH TABLES WITH READ LOCK;"
mysqldump --all-databases --user=root --password=root --master-data > masterdatabase.sql
scp masterdatabase.sql root@192.168.46.12:/home
