#!/bin/bash
number=$1

# -gt -lt -eq -ge -le
if [$number -gt 100]
then 
   echo "Given nuber is greater than 100"
else
   echo "number is less than 100"
fi

