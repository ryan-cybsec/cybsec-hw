#!/bin/sh

if [ -z "$1" ]; then
	echo "Usage: $(basename $0) [mmdd] [hh:mm:ss AM|PM]"
	exit 0
fi

filename="${1}_Dealer_schedule"
shift
time="$@"


grep "$time" "$filename" | cut -f3
