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

printf "Enter a number: "
read ONE
printf "Enter another number: "
read TWO

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
