#!/bin/bash

USAGE =$( df -hT | grep xfs)

#awk -F " " '{print $5F}" | cut -d "%" -f1)

echo "disk usage is: $USAGE "

