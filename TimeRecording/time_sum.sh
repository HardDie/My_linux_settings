#!/bin/bash
if [[ $# -lt 2 ]]; then
    echo 'Too few argument';
    exit;
fi;
result_sum=0;
for i in $@; do
    StartDate=$(date -u -d "$result_sum" +"%s");
    FinalDate=$(date -u -d "$i" +"%s");
    result_sum=$(date -u -d "0 $StartDate sec + $FinalDate sec" +"%H:%M:%S");
done
echo $result_sum;
