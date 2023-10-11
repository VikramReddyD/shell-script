#!/bin/bash
#colours
#validations
# log redirections
LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log
Message=""
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
while IFS= read line
do
    usage=$(echo $line | awk '{print $6}'| cut -d % -f1)
    partition=$(echo $line | awk '{print $1}')
    if [ $usage -gt $DISK_USAGE_THRESHOLD ];
    then 
    Message+="High disk usage on $partition: $usage \n"
    fi
done <<< $DISK_USAGE
echo "message: $Message"
#echo "$Message" | mail -s "message" vikram.dannarapu@gmail.com

sh mail.sh vikram.dannarapu@gmail.com "High Disk Usage" "$Message" "DevOps Team" "High DISK USAGE"