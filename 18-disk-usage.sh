#!/bin/bash

USAGE=$( df -hT | grep xfs)

#awk -F " " '{print $5F}" | cut -d "%" -f1)

while read -r line
do
echo "disk usage is: $line "

done <<< $USAGE