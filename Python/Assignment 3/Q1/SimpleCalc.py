while True:
    print("Welcome to Simple Calculator in Python!!")
    print("Select from one of these operations:")
    print("[A-Z] - Exit")
    print("1 - Add")
    print("2 - Subtract")
    print("3 - Multiply")
    print("4 - Divide")
    print("Enter your choice: ", end='')
    choice = input()

    if choice.isalpha():
        break
    if not choice.isalnum():
        print("Wrong choice! Try Again.\n")
        continue

    choice = int(choice)
    if choice not in [1, 2, 3, 4]:
        print("Wrong choice! Try Again.\n")
        continue

    print("Enter first number: ", end='')
    n1 = int(input())
    print("Enter second number: ", end='')
    n2 = int(input())

    if choice == 1:
        print(n1, "+", n2, "=", (n1 + n2), "\n")
    elif choice == 2:
        print(n1, "-", n2, "=", (n1 - n2), "\n")
    elif choice == 3:
        print(n1, "*", n2, "=", (n1 * n2), "\n")
    elif choice == 4:
        if n2 == 0:
            print("You cannot divide by zero.\n")
            continue
        print(n1, "/", n2, "=", (n1 / n2), "\n")
