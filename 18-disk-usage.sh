#!/bin/bash

DISK_USAGE=$( df -hT | grep xfs)
DISK_THRESHOLD=5
MSG=" "

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')

    #echo $USAGE of the Partition is $PARTITION

    if [ $USAGE -ge $DISK_THRESHOLD ]
        then 
        MSG+="high disk utilization on partition $PARTITION and usage is $USAGE \n"
    fi

done <<< $DISK_USAGE
echo -e "Message: /n $MSG"