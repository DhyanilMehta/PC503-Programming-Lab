import re

STRING = '''You have received first email from abc@gmail.com at 11:00 am on 1st October, You have received second 
email from def@gmail.com at 1:30 pm on 2nd October, You have received third email from pqr@gmail.com at 10:30 am on 
3rd October, You have received fourth email from qwert@gmail.com at 11:00 am on 4th October, You have received fifth 
email from spam@gmail.com at 1:00 pm on 5th October'''

# a. Fetch all the email ids from the given text using the 'findall' function in regular expressions.
print("a. Fetch all the email ids from the given text using the 'findall' function in regular expressions.\n")
emailIds = re.findall(r'\w+@\w+\.\w{2,3}', STRING)
print("Fetched email IDs: ", emailIds)
print()

# b. Change the domain name as daiict.ac.in from all the email ids from given input using 'sub' function
print("b. Change the domain name as daiict.ac.in from all the email ids from given input using 'sub' function\n")
updatedString = re.sub(r"gmail\.com", "daiict.ac.in", STRING)
print("Updated text with updated email ids:")
print(updatedString)
print()

# c. Search the email id 'spam@gmail.com' from given input text
print("c. Search the email id 'spam@gmail.com' from given input text\n")
searchRes = re.search(r"spam@gmail\.com", STRING)
if searchRes is not None:
    print("Found spam@gmail.com in the input text at index", searchRes.start())
else:
    print("spam@gmail.com not found")
print()

# d. Fetch all time and date of all email ids.
print("d. Fetch all time and date of all email ids.\n")
timeList = re.findall(r"\d{1,2}:\d{2}[ ](?:am|pm)", STRING)
dateList = re.findall(r"\d{1,2}(?:st|nd|rd|th)\s(?:January|February|March|April|May|June|"
                      r"July|August|September|October|November|December)", STRING)

print("Email from:\t\tAt time:\tOn date:")
for i in range(0, len(emailIds)):
    print(emailIds[i], timeList[i]+"\t" if timeList[i].endswith("pm") else timeList[i], dateList[i], sep="\t")
