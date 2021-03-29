import re

print("Welcome to DAIICT Student System!! Please enter your details below correctly:")

while True:
    student_id = input("Enter your Student ID: ")
    if re.match(r'^\d+$', student_id) is not None:
        break
    print("Please enter a student ID with only digits.")

student_id = int(student_id)

while True:
    student_name = input("Enter your name: ")
    if re.match(r'^[a-zA-Z]+[ ]?[a-zA-Z]+$', student_name) is not None:
        break
    print("Please enter a valid student name with a single space.")

student_name = student_name.strip()

while True:
    fees_amount = input("Enter the fees amount paid: ")
    if re.match(r'^[0-9]+(\.[0-9]{2})?$', fees_amount) is not None:
        break
    print("Please enter an appropriate fees amount.")

# fees_amount = float(fees_amount)

email_id = student_name.lower().replace(" ", "") + "@daiict.ac.in"

print("\nWelcome to DAIICT!! Here are your Student Details:")
print("Student ID:", student_id)
print("Student Name:", student_name)
print("Fees amount paid:", fees_amount)
print("New Email ID:", email_id)
