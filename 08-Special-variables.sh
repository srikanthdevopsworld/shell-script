#!/bin/bash
echo "All variables passed: $@ "
echo "Number of variables: $# "
echo "script name: $0 "
echo "Present working directory: $PWD "
echo "user hoem directory: $HOME "
echo "Process id of current script: $$ "
sleep 60 &
echo "process id of last command in background: $! "
