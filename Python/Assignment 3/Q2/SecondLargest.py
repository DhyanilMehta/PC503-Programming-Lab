print("Input first number: ", end='')
n1 = int(input())
print("Input second number: ", end='')
n2 = int(input())
print("Input third number: ", end='')
n3 = int(input())
secondLargest = n1
if n1 >= n2 and n1 >= n3:
    if n2 >= n3:
        secondLargest = n2
    else:
        secondLargest = n3
elif n2 >= n1 and n2 >= n3:
    if n1 >= n3:
        secondLargest = n1
    else:
        secondLargest = n3
elif n1 >= n2:
    secondLargest = n1
else:
    secondLargest = n2

print("The second largest number is {0}".format(secondLargest))
