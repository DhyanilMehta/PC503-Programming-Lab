n = int(input("Enter n: "))
fibonacci_list = [0, 1]

if n == 0:
    print([])
elif n == 1:
    print(fibonacci_list[0:1])
else:
    while len(fibonacci_list) < n:
        fibonacci_list.append(fibonacci_list[-2] + fibonacci_list[-1])

    print(fibonacci_list)
