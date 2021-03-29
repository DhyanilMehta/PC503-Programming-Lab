def fib(n):
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)


k = int(input("Enter the number till which you wish to print the Fibonacci series: "))
print("Fibonacci series till " + str(k) + ":")

fibSum = 0  # Variable to pass to the function fib(n) to calculate the fibonacci value till fibSum terms
fibRes = fib(fibSum)

# Loop to check the calculated fibonacci value and print it if less than k
while fibRes <= k:
    print(fibRes, end=' ')
    fibSum += 1
    fibRes = fib(fibSum)
