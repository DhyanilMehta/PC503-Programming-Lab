STRING = '''You have received first email from abc@gmail.com, You have received second email from def@gmail.com, 
You have received third email from pqr@gmail.com, You have received fourth email from qwert@gmail.com, 
You have received fifth email from spam@gmail.com'''

# Sub-question 1
lineList = STRING.split(',')
emailList = list()
for line in lineList:
    line.strip()
    wordList = line.split()
    emailList.append(wordList[-1])

print("1) List of extracted email ids: ", emailList)
print()

# Sub-question 2
print("2) Email id with max length: " + max(emailList, key=len))
print()

# Sub-question 3
daiictEmail = "daiict@gmail.com"
if daiictEmail not in emailList:
    print("3) Not received email from " + daiictEmail + ". Adding it to the list...")
    emailList.append(daiictEmail)

print(emailList, "\n")

# Sub-question 4
print("4) Deleting spam email ids from the list...")
emailList.remove("spam@gmail.com")
print(emailList, "\n")

# Sub-question 5
print("5) Position(Index) of pqr@gmail.com in the list:", emailList.index("pqr@gmail.com"))
