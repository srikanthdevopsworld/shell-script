#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14} #Optional

LOG_FOLDER="/home/ec2-user/app-log"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}'| cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S )
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USAGE(){
    echo -e " $R Usage:: $N sh backup.sh <source-dir> <destination-dir> <days> "
    exit 1
}

mkdir -p /home/ec2-user/app-log

if [ $# -lt 2 ]
 then 
  USAGE
fi

mkdir -p /home/ec2-user/archive-log

if [ ! -d $SOURCE_DIR ]
    then
        echo -e " $R $SOURCE_DIR does not exist.. please check $N "
        exit 1
fi

if [ ! -d $DESTINATION_DIR ]
    then
        echo -e " $R $DESTINATION_DIR does not exist.. please check $N "
        exit 1
fi

FILES_TO_DELETE = $( find $SOURCE_DIR -name "*.log" -mtime +$DAYS )

if [ -n "$FILES_TO_DELETE" ]
    then
        echo "files are $FILES_TO_DELETE"
        ZIP_FILE="$DESTINATION_DIR/app-logs-$TIMESTAMP.zip"
        find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
     then
     echo -e "successfully created zip files for older than $DAYS "
        while read -r filepath
        do
        echo "deleting file: $filepath" &>>$LOG_FILE_NAME
        rm -rf $filepath
        done <<< $FILES_TO_DELETE
    else
        echo -e "$R ERROR: $N Failed to create ZIP files"
        exit 1
    fi

else
    echo "No files to delete older than $DAYS"
fi


