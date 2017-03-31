#!/bin/bash
if [[ $# -lt 2 ]]; then
    echo 'Too few argument';
    exit;
fi;
string1=$2;
string2=$1;
StartDate=$(date -u -d "$string1" +"%s");
FinalDate=$(date -u -d "$string2" +"%s");
date -u -d "0 $FinalDate sec - $StartDate sec" +"%H:%M:%S";
