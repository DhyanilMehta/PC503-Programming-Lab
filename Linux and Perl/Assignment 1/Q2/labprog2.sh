#!/bin/bash

read -p "Enter first number: " num1
read -p "Enter second number: " num2

sum=`expr $num1 + $num2`
diff=`expr $num1 - $num2`
mult=`expr $num1 \* $num2`

echo "Sum: $sum, Difference: $diff, Multiplication: $mult"
