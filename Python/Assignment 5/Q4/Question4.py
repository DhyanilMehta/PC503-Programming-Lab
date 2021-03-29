marks_tuples = [(202021001, 'S-I', 65), (202021001, 'S-II', 85), (202021001, 'S-III', 75),
                (202021002, 'S-I', 85), (202021002, 'S-II', 65), (202021002, 'S-III', 55),
                (202021003, 'S-I', 100), (202021003, 'S-II', 95), (202021003, 'S-III', 98),
                (202021004, 'S-I', 25), (202021004, 'S-II', 98), (202021004, 'S-III', 85),
                (202021005, 'S-I', 26), (202021005, 'S-II', 44), (202021005, 'S-III', 79)]

student_marks = dict()
highestTotalTuple = (0, 0)
for mark_tuple in marks_tuples:
    student_marks[mark_tuple[0]] = student_marks.get(mark_tuple[0], []) + [mark_tuple[2]]

for k, v in student_marks.items():
    total = sum(v)
    print("Student ID:", k, "\tMarks:", v, "\tTotal:", total)
    if highestTotalTuple[1] < total:
        highestTotalTuple = (k, total)

print("\nStudent ID with the highest overall total: ")
print("Student ID:", highestTotalTuple[0], "\tTotal:", highestTotalTuple[1])
