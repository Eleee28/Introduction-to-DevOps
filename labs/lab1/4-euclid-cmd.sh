#! /bin/bash
# Euclid's Algorithm (read from command line)

gcd() {
	local a=$1
	local b=$2

	if [ $a -eq 0 ]; then
		echo $b
	else
		let "rem = b % a"
		gcd $rem $a
	fi
}

call_gcd() {
	result=$(gcd $1 $2)
	echo "The GCD of $1 and $2 is: $result"
}

# check num of args - $#
if [ $# -le 0 ] || [ $# -ge 3 ]; then
	echo "Usage: ./gcd_v2.sh <num1> <num2>"
	echo '"./gcd_v2.sh test" for automatic tests'

else

	if [ $1 == "test" ]; then
		call_gcd 10 15
		echo
		call_gcd 35 10
		echo
		call_gcd 31 2

	else
		if [ $1 -ge 0 ] && [ $2 -ge 0 ]; then
			call_gcd $1 $2
		else
			echo "Please enter positive numbers"
		fi
	fi
fi
