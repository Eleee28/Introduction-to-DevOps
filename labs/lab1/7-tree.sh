#! /bin/bash
# Print Christmast tree pattern with the given number of rows

echo -e

print_tree() {
	
	let N=$1
	let "COL = ((N - 1) * 2) + 1"
	let i=0

	while [ $i -le $N ]; do
		
		let j=0
		#echo "row: $i"

		# Last row (|)
		if [ $i -eq $N ]; then
			while [ $j -lt $COL ]; do
				if [ $j -eq $((N - 1)) ]; then
					echo -n "|"
				else
					echo -n " "
				fi
				let j++
			done
			echo

		else # leaves (*)
			while [ $j -lt $COL ]; do
				if [ $j -ge $((N - 1 - i)) ] && [ $j -le $((N - 1 + i)) ]; then
					echo -n "*"
				else
					echo -n " "
				fi
				let j++
			done
			echo
		fi
		let i++
	done
}

if [ $# -ne 1 ]; then
	echo "Wrong number of arguments"
	echo "Usage: ./tree <number>"
else
	print_tree $1
fi
