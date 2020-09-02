#!/bin/bash

nums=(0 1 2 3 4 5 6 7 8 9)
states=("oregon" "washington" "new york" "colorado" "hawaii")
lsout="$(ls)"

for i in ${nums[@]}; do
	if [ "$i" -eq 3 ] || [ "$i" -eq 5 ] || [ "$i" -eq 7 ]; then
		echo "$i"
	fi
done

found="I'm not fond of New York."
for state in "${states[@]}"; do
	if [ "$state" = "new york" ]; then
		found="New York is the best!"
	fi
done
echo "$found"

for line in ${lsout[@]}; do
	echo "$line"
done
