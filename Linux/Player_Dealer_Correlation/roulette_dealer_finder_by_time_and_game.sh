#!/bin/sh

set -e

if [ -z "$1" ]; then
	echo "Usage: $(basename $0) [game] [mmdd] [hh:mm:ss AM|PM]"
	exit 0
fi

(printf %s\\n $1 | grep -iq "^[0-9a-z]\+\$") || { >&2 echo "Game must be a number or a game name!" && exit 1; }
game="$1"
shift

(printf %s\\n $1 | grep -iq "^[0-9]\{4\}\$") || { >&2 echo "Date must be a four digit number!" && exit 1; }
filename="$1_Dealer_schedule"
shift

time="$@" # I don't know why the lines below break if I use "$@" directly  and I hate it.
(printf %s\\n "$time" | grep -iq "^[0-1]\?[0-9]\(:[0-9]\{2\}\)\{2\} [A|P]M$") \
	|| { >&2 echo "Time must be in the format HH:mm:ss [AM|PM]" && exit 1; }

case $game in
	[0-9]*)
		[ "$game" -gt "0" ] || { >&2  echo "The first game is game 1. (Asked for game $game)" && exit 1; }

		maxfieldno="$(expr $(head -n1 "$filename" | sed "s/[^\t]//g" | wc -c) - 1)"
		[ "$game" -le "$maxfieldno" ] \
			|| { >&2  echo "There are only $maxfieldno games! (Asked for game $game)" && exit 1; }

		fieldno="$(expr 1 + $game)"
		;;

	*)
		(head -n1 "$filename" | grep -iq "$game") || { >&2 echo "Didn't recognize game $game" && exit 1; }
		fieldno="$(head -n1 "$filename" | sed -e "s/^\(.\+$game\).\+\$/\1/i" -e "s/[^\t]//g" | wc -c)"
		;;
esac
grep -i "$time" "$filename" | cut -f$fieldno
