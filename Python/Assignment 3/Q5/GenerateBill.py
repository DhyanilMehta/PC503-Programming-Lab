items = dict()
while True:
    item = input("Enter name of item(Enter 'done' to stop): ")
    if item == "done":
        break
    price_str = input("Enter price of item: ")
    price = int(price_str)

    items[item] = price

print("\nHere is your Bill!")
for item, price in items.items():
    print("Item: " + item + "\tPrice:", price)

total = sum(items.values())
print("Total Amount:", total)

# discount = 0.0
# Sub-question - 1
# print("Sub-question - 1")
# if total > 500:
#     discount = 0.02
# else:
#     discount = 0.01

# Sub-question - 2
# print("Sub-question - 2")
# if total >= 1000:
#     discount = 0.05
# elif 500 <= total < 1000:
#     discount = 0.02
# else:
#     discount = 0.01

# total -= total * discount

# print("Discount applied: {0}%".format(discount*100))
# print("Final Amount:", total)

print("Thank you for shopping! :)")
