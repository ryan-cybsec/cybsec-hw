#!/usr/bin/env bash

months=('jan'
	'feb'
	'mar'
	'apr'
	'may'
	'jun'
	'jul'
	'aug'
	'sep'
	'oct'
	'nov'
	'dec')

days=('mon' 'tue' 'wed' 'thu' 'fri' 'sat' 'sun')

for month in ${months[@]}; do
	echo "$month"
done

for i in {0..5}
do
	echo $i
done
