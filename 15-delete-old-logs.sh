#!/bin/bash
USERID=$(ID -u)

SOURCE_DIR="/home/ec2-user/app-logs"

LOG_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo " files to be deleted: $FILES_TO_DELETE "
