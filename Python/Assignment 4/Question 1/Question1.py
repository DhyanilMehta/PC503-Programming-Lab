numbers = list()
while True:
    string = input("Enter a number: ")
    if string == 'done':
        break
    numbers.append(int(string))

print("Maximum: {}".format(max(numbers)))
print("Minimum: {}".format(min(numbers)))
