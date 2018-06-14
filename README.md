Import and export database from local to server

# Configuration

The script uses these environment variables. Make sur to define them before used : 

**Export scripts environment variables**
* DB_NAME="mariegalante"
* MYSQL_ROOT_PASSWORD="1234567"
* MYSQL_LOCAL_SAVE_DIR="./mysql/"
* MYSQL_SERVER_EXPORT_DIR="/home/nicolas/sources/databases/import/mariegalante/"
* SERVER_DESTINATION="nicolas@149.202.50.62"


**Import scripts environment variables**
* DB_BACKCUP_FILE_NAME="db_backup.sql"
* DB_NAME="mariegalante"
* PATH_MYSQL_CONF="/etc/mariegalante.my.cnf"
* MYSQL_SERVER_IMPORT_DIR="/home/nicolas/sources/databases/import/mariegalante/"


# Export 

Use export script on the local dev to export from local to server

# Import

Use import script on server to import previously exported data 