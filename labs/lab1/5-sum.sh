#! /bin/bash
# Sum command-line arguments (use shift)

let SUM=0

while [ $# -ne 0 ]; do
	let "SUM = $SUM + $1"
	shift
done

echo "The sum is: $SUM"

# another solution (without shift) is iterating on $@ (contains all arguments)

# Another solution with shift
# ACCUM=0
#
# while [ ! -z $1 ]; do
#	let ACCUM+=$1
#	shift
# done

# echo "The sum is: $ACCUM"
