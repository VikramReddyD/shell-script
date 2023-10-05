#!/bin/bash
#!/bin/bash

# our program goal is to install mysql
DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
USERID=$(id -u)
#This function should validate the previous command and inform the user if it is success or not
VALIDATE(){
    # $1 will be the argument passed from the command line from the below code to this function
if [ $1 -ne 0 ]
then
    echo "$2 : installation is failure"
    exit 1
else
    echo " $2 :  successfully installed"
fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
# else
#     echo "INFO:: You are root user"
fi

# it is our responsibility again to check installation is success or not
yum install mysql -y &>>$LOGFILE

VALIDATE $? "installing MQ SQL"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "installing POSTFIX"
