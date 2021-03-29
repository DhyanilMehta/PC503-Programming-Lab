student_details = {1001: "Ram", 1004: "Shyam", 1005: "Kamal", 1003: "John"}

# i) Print details of Students
for s_id, s_name in student_details.items():
    print("ID: " + str(s_id) + "\tName: " + s_name)

# ii) Print ids of Students
print("Student IDs:")
for s_id in student_details.keys():
    print(s_id)

# iii) Print Students name in ascending order
print("Student names in ascending order:")
for s_name in sorted(student_details.values()):
    print(s_name)

# iv) Delete the details of student id = 1005 and print updated dictionary
print("\nDeleting details of ID 1005...")
student_details = {s_id: s_name for s_id, s_name in student_details.items() if s_id != 1005}
print("Displaying updated dictionary")
for s_id, s_name in student_details.items():
    print("ID: " + str(s_id) + "\tName: " + s_name)

# v) Update the name of student id = 1003 to “Kishan” and print updated dictionary
print("\nUpdating name of ID 1003 to Kishan...")
student_details[1003] = "Kishan"
print("Displaying updated dictionary")
for s_id, s_name in student_details.items():
    print("ID: " + str(s_id) + "\tName: " + s_name)

# vi) Check whether details of students with id 1002 exists in the dictionary.
print("\nChecking if details of student with ID 1002 exists or not...")
s_name = student_details.get(1002, "Does not exist")
if s_name != "Does not exist":
    print("A student with ID 1002 exists with name " + student_details[1002])
else:
    print("There are no details for student with ID 1002")
