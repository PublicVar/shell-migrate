#!/bin/bash

# Export databases in tar.gz and send to server
# 
# Configurations : 
# You have to have permission to login to server by ssh


##################################
########## LOCAL SIDE ############
##################################

echo "############################"
echo "# Export project database ##"
echo "############################"

# Docker version
docker-compose exec mysql sh -c 'exec mysqldump -uroot -p'"$MYSQL_ROOT_PASSWORD"" $DB_NAME" > $MYSQL_LOCAL_SAVE_DIR$DB_NAME.sql

# Mysql client version
#mysqldump -uroot -p$MYSQL_ROOT_PASSWORD $DB_NAME > $MYSQL_LOCAL_SAVE_DIR$DB_NAME.sql

echo "############################"
echo "# Compress database files ##"
echo "############################"

tar -zcvf $MYSQL_LOCAL_SAVE_DIR$DB_NAME.tar.gz $MYSQL_LOCAL_SAVE_DIR$DB_NAME.sql

echo "############################"
echo "# Send database to server ##"
echo "############################"

scp $MYSQL_LOCAL_SAVE_DIR$DB_NAME.tar.gz "$SERVER_DESTINATION:$MYSQL_SERVER_EXPORT_DIR"


