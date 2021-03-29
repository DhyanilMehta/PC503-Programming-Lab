#!/bin/bash

if [ $# -eq 1 ]
then
	negation=$(( 0 - $1 ))
	echo Negation: $negation
	exit 0
else
	echo Sum: $(( $1 + $2 )), Difference: $(( $1 - $2 )), Multiplication: $(( $1 * $2 ))
fi
