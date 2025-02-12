#!/bin/bash

set -e

draw_tree() {
	n=$1
	indent=$((n - 1))
	stars=1

	for (( i=0; i<$n; i++ )); do
		for (( j=0; j<$indent; j++ )); do
			printf " "
		done

		for (( k=0; k<$stars; k++ )); do
			printf "*"
		done

		indent=$((indent - 1))
		stars=$((stars + 2))
		echo
	done

	for (( i=0; i<$n-1; i++ )); do
		printf " "
	done
	echo "|"

}

N=$1

draw_tree $N

# Pseudo code:
#
# func draw_tree(n):
#	indent = n - 1
#	stars = 1
#
#	for i in 1...n:
#		for j in 1...indent:
#			print " "
#		for k in 1...stars:
#			print "*"
#		indent -= 1
#		stars += 2
#	for i in 1...n-1:
#		print " "
#	print "|"
