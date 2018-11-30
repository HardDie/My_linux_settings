#!/bin/bash

#echo $@ >> /tmp/my.log
#echo Zero: $0 >> /tmp/my.log
#echo One: $1 >> /tmp/my.log
#echo Two: $2 >> /tmp/my.log
#echo Three: $3 >> /tmp/my.log

if [[ $1 == *"Z"* ]]; then
	echo "Z"
elif [[ $1 == *"-"* ]]; then
	echo "-"
else
	echo ":"
fi
