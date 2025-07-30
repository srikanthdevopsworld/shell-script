#!/bin/bash

USAGE=$(df -h | awk -F " " '{print $5F}" | cut -d "%" -f1 )

echo "disk usage is: $USAGE "

