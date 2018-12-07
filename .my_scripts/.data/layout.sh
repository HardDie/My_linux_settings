#!/bin/bash

VAL=$(xset -q | grep LED | cut -d ':' -f 4)
case $VAL in
    *"0002"*)
        echo Eng
        echo
        echo '#fff'
        ;;
    *"1002"*)
        echo Rus
        echo
        echo '#fff'
        ;;
    *)
        echo $VAL
        echo
        echo '#FF0000'
        ;;
esac
