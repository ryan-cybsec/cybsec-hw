#!/bin/sh

day="$(basename $0 | cut -d. -f1)"
mm="$(echo $day | cut -c 1-2)"
dd="$(echo $day | cut -c 3-4)" # casting a shadow on the real 'dd'

echo "$mm/$dd"
echo "====="
grep -h "05:00:00 AM" ${day}_Dealer_schedule | awk '{ print $1,$2,$5,$6 }'
grep -h "08:00:00 AM" ${day}_Dealer_schedule | awk '{ print $1,$2,$5,$6 }'
grep -h "02:00:00 PM" ${day}_Dealer_schedule | awk '{ print $1,$2,$5,$6 }'
[ "$dd" = "15" ] || grep -h "08:00:00 PM" ${day}_Dealer_schedule | awk '{ print $1,$2,$5,$6 }'
[ "$dd" = "15" ] || grep -h "11:00:00 PM" ${day}_Dealer_schedule | awk '{ print $1,$2,$5,$6 }'
