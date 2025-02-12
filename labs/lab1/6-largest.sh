#! /bin/bash
# Sum command-line arguments (use shift)

set -e # exits on error (-e : enable abort on error)

let BIG=0

while [ $# -ne 0 ]; do
	if [ $1 -gt $BIG ]; then
		let "BIG = $1"
	fi
	shift
done

echo "The largest number is: $BIG"

# Another solution
#
# LARGEST=$1
#
# while [ ! -z $1 ]; do
#	if [ $1 -gt $LARGEST ]; then
#		let LARGEST=$1
#	fi
#	shift
# done
#
# echo "The largest number is: $LARGEST"
