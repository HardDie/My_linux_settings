#!/bin/bash
if [[ $# -lt 2 ]]; then
    echo 'Too few argument';
    echo 'Try: '$0' [Times/1:15 0:11] [Year Month/2017 mar]'
    exit;
fi;

result_sum=0;
FILE=~/Desktop/time.log

if [[ -z `echo $1 | grep -v :` ]]; then
    # If input time
    source=$@;
else
    # If input year and month
    last_year=$1;
    last_month=$2;
    source=`cat $FILE | grep -A 2 "$last_year" | grep -iA 2 "$last_month" | grep "up" | awk '$3 ~/hours/' | awk '{ print $2":"$4 }'`;
    source=$source" "`cat $FILE | grep -A 2 "$last_year" | grep -iA 2 "$last_month" | grep "up" | awk '$3 ~/minutes/' | awk '{ print "00:"$2 }'`;
fi;

if [[ ! -z $source ]]; then
    for i in $source; do
        StartDate=$(date -u -d "$result_sum" +"%s");
        FinalDate=$(date -u -d "$i" +"%s");
        result_sum=$(date -u -d "0 $StartDate sec + $FinalDate sec" +"%H:%M:%S");
    done
fi;
echo $result_sum;
