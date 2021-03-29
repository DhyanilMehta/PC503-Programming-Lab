string = input("Input: ")
splitList = string.split()
if len(splitList) in [0, 1]:
    print("Output: Error: String is less than 2 words")
else:
    firstTwo = splitList[0][:2]
    lastTwo = splitList[-1][-2:]
    concatStr = lastTwo + firstTwo
    print("Output: " + concatStr)
