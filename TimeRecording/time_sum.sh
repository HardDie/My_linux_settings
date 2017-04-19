#!/bin/bash
if [[ $# -lt 2 ]]; then
    echo 'Too few argument';
    echo 'Try: '$0' [Times/1:15 0:11] [Year Month/2017 mar]';
    exit;
fi;

result_hours=0;
result_minutes=0;
FILE=~/Desktop/time.log;

if [[ -z `echo $1 | grep -v :` ]]; then
    # If input time
    source=$@;
else
    # If input year and month
    last_year=$1;
    last_month=$2;
    source=`cat $FILE | grep -A 2 "$last_year" | grep -iA 2 "$last_month" | grep "up" | awk '$3 ~/hour/' | awk '{ print $2":"$4 }'`;
    source=$source" "`cat $FILE | grep -A 2 "$last_year" | grep -iA 2 "$last_month" | grep "up" | awk '$3 ~/minute/' | awk '{ print "00:"$2 }'`;
fi;

if [[ ! -z $source ]]; then
    for i in $source; do
        hours=$(echo $i | awk -F':' '{ print $1 }');
        minutes=$(echo $i | awk -F':' '{ print $2 }');

        if [[ -z $hours ]]; then
            hours=0;
        fi
        if [[ -z $minutes ]]; then
            minutes=0;
        fi

        result_hours=$(($result_hours + $hours));
        result_minutes=$(($result_minutes + $minutes));
    done
fi;
result_hours=$(($result_hours + $result_minutes / 60));
result_minutes=$(($result_minutes % 60));
echo "result time = "$result_hours":"$result_minutes;
