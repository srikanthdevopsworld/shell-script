#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14} #Optional

LOG_FOLDER="/home/ec2-user/app-logs"
LOG_FILE=$(echo #0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S )
LOG_FILE_NAME=$($LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log)
USAGE(){
    echo -e " $R Usage:: $N backup-file-name.sh <source-dir> <destination-dir> <days>
    exit 1
}

if [ $# -lt 2 ]
 then 
  USAGE
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime $DAYS )
echo "Files to delete are: $FILES_TO_DELETE"
mkdir -p /home/ec2-user/app-logs
mkdir -p /home/ec2-user/archive-logs

if [ ! -d "$SOURCE_DIR" ]
    then
        echo -e "$R $SOURCE_DIR does not exist.. please check $N"
        exit 1
fi
if [ ! -d "$SOURCE_DIR" ]
    then
        echo -e "$R $DESTINATION_DIR does not exist.. please check $N"
        exit 1
fi




