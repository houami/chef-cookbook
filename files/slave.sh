mysql -e "CREATE DATABASE slavedb;"
mysql -u root -p root slavedb < /home/masterdatabase.sql
service mysql restart
mysql -e "CHANGE MASTER TO MASTER_HOST='192.168.56.1',MASTER_USER='slave_user', MASTER_PASSWORD='password', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=  107;"
mysql -e "START SLAVE;"
mysql -e "SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1; SLAVE START;"
