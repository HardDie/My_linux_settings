#!/bin/bash
if [[ $# -lt 2 ]]; then
    echo 'Too few argument';
    echo 'Try: '$0' [lower_number substracted/12:06 4:20]';
    exit;
fi;
string1=$2;
string2=$1;
StartDate=$(date -u -d "$string1" +"%s");
FinalDate=$(date -u -d "$string2" +"%s");
if [[ $FinalDate -lt $StartDate ]]; then
    echo "Wrong arguments";
    exit;
fi;
date -u -d "0 $FinalDate sec - $StartDate sec" +"%H:%M:%S";
