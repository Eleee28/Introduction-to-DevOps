#!/bin/bash

gcd() {
	a=$1
	b=$2

	while [ $a -ne $b]; do
		if [ $a -gt $b ]; then
			a=$((a-b))
		else
			b=$((b-a))
		fi
	done

	echo $a
}

ONE=$1
TWO=$2

# Error checking (two arguments)
if [ -z $ONE ] || [ -z $TWO ]; then # check against empty strings
	echo "Error you need to enter two numbers" >&2 # echo to stderr
	exit 1
fi


RESULT=$(gcd $ONE $TWO)
echo "The GCD of $ONE and $TWO is: $RESULT"

# Pseudo code:
# func gcd(a, b):
#	while a != b:
#		if a > b
#			a = a - b
#		else
#			b = b - a
#	return a
