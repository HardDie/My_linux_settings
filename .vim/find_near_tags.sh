#!/bin/bash

FIND=0
IS_OVER=0

while [[ $IS_OVER -ne 1 ]]; do
	for a in $(ls); do
		if [[ $a == 'tags' ]]; then
			FIND=1
			IS_OVER=1
			echo -n "$PWD/tags"
			exit 0
		fi
	done

	if [[ $FIND -eq 0 ]]; then
		cd ..
		if [[ $PWD == "/" ]]; then
			exit 1
		fi
	fi
done
