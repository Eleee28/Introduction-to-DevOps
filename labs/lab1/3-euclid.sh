#! /bin/bash
# Euclid's Algorithm (use read command to read from stdin)

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

read -p "Enter the first number: " n1
read -p "Enter the second number: " n2
echo

if [ $n1 == "test" ]; then
	call_gcd 10 15
	echo
	call_gcd 35 10
	echo
	call_gcd 31 2

else
	if [ $n1 -ge 0 ] && [ $n2 -ge 0 ]; then
		call_gcd $n1 $n2
	else
		echo "Please enter positive numbers"
	fi
fi
