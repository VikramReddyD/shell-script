APP_LOGS_DIR=/home/centos/app-logs
DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
FILES_TO_DELETE=$(find $APP_LOGS_DIR -name -ls -o -regex '.*\.log' -type f -mtime +30)
echo "$FILES_TO_DELETE"
while read line
 do
    echo "Deleting $line" &> $LOGFILE
    rm -rf $line
 done < $FILES_TO_DELETE
