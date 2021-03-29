def check_armstrong(num):
    power = len(str(num))  # Power will be equal to the number of digits
    armstrong_sum = 0
    tmp = num
    # Calculate Armstrong sum
    while tmp > 0:
        digit = tmp % 10
        armstrong_sum += digit ** power
        tmp //= 10
    # Check if the Armstrong sum is equal to the number
    return num == armstrong_sum

number = int(input("Enter any number: "))
if check_armstrong(number):
    print(number, "is an Armstrong number")
else:
    print(number, "is not an Armstrong number")
