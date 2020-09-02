#!/bin/bash

sensitivefiles=(
	"/etc/hosts"
	"/etc/passwd"
	"/etc/shadow"
)

for filename in "${sensitivefiles[@]}"; do
	# Print the tail end of stat's Access line for each "sensitive file."
	echo -e "$filename:\t$(ls -l "$filename" | awk '{ print $1, $3, $4 }')"
done
