#!/bin/bash

STR=$(uptime -p)
STR=(${STR//,/ })
RES=""

for ONE in ${STR[@]}
do
    if [[ $ONE == "up" ]]; then
        STEP=1
        continue
    fi

    if [[ $STEP == 1 ]]; then
        STEP=2
        RES+=$ONE
        continue
    fi
    if [[ $STEP == 2 ]]; then
        STEP=1
        if [[ $ONE == *"day"* ]]; then
            RES+="d "
        elif [[ $ONE == *"hour"* ]]; then
            RES+="h "
        elif [[ $ONE == *"min"* ]]; then
            RES+="m "
        elif [[ $ONE == *"week"* ]]; then
            RES+="w "
        else
            # In wrong case
            RES+=" $ONE "
        fi
        continue
    fi
done

echo $RES
