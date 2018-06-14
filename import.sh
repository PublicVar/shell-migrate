#!/bin/bash

# Import databases from a tar.gz
# HOW TO USE 
# 1-Send the database compressed file into the $MYSQL_SERVER_IMPORT_DIR (see value variable below)
# 2-Edit the variables for needs
# 3-Launch this script import.sh (do not forget to give execution permission to the script)
# 
# Configurations : 
# To avoid enter password create and use a mysql conf file  
# e.g. 
# File /etc/custom.my.cnf
# @code
# [client]
# host=localhost
# user=database_username
# password=database_password
# @endcode



##################################
########## SERVER SIDE ###########
##################################

# Extract sources
echo "############################"
echo "### Extract sources files ##"
echo "############################"

tar -zxvf "$MYSQL_SERVER_IMPORT_DIR$DB_NAME.tar.gz" $MYSQL_SERVER_IMPORT_DIR
exit
# Backup local db
echo "################################"
echo "### Backup local database ######"
echo "################################"

mysqldump --defaults-extra-file=$PATH_MYSQL_CONF  --extended-insert --lock-tables  $DB_NAME > $DB_BACKCUP_FILE_NAME

# Drop all tables in database
echo "################################"
echo "### Empty local database #######"
echo "################################"

mysql --defaults-extra-file=$PATH_MYSQL_CONF -Nse 'show tables' $DB_NAME | while read table; do mysql --defaults-extra-file=/etc/custom.my.cnf -e "SET FOREIGN_KEY_CHECKS = 0; drop table \`$table\`" $DB_NAME; done

# Import the database backupi
echo "################################"
echo "### Import new database ########"
echo "################################"

mysql --defaults-extra-file=$PATH_MYSQL_CONF $DB_NAME < $DB_NAME.sql

# Clear drupal cache
echo "################################"
echo "### Clear Drupal cache ########"
echo "################################"

vendor/bin/drush cr