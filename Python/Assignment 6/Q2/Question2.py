def recur_bin_search(arr, lo, hi, x):
    if hi >= lo:
        mid = (hi + lo) // 2

        if arr[mid] == x:
            return mid
        elif arr[mid] > x:
            return recur_bin_search(arr, lo, mid-1, x)
        else:
            return recur_bin_search(arr, mid + 1, hi, x)
    else:
        return -1


def non_recur_bin_search(arr, x):
    lo = 0
    hi = len(arr) - 1

    while lo <= hi:
        mid = (hi + lo) // 2

        if arr[mid] < x:
            lo = mid + 1
        elif arr[mid] > x:
            hi = mid - 1
        else:
            return mid

    return -1

testCase1 = [102, 118, 124, 131, 140, 148, 161, 166, 176, 180]
testCase2 = [37, 49, 64, 84, 95]

print("Recursive Binary Search:")
print("Array: ", testCase1)
elem = int(input("Enter element to search: "))
idx = recur_bin_search(testCase1, 0, len(testCase1)-1, elem)
if idx != -1:
    print("Element {} found at position {} in the array".format(elem, idx))
else:
    print("Element {} not found in the array".format(elem))

print("\nNon-recursive Binary Search:")
print("Array: ", testCase2)
elem = int(input("Enter element to search: "))
idx = non_recur_bin_search(testCase2, elem)
if idx != -1:
    print("Element {} found at position {} in the array".format(elem, idx))
else:
    print("Element {} not found in the array".format(elem))
