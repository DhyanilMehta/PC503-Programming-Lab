myfile_update = open("myfile.txt", "r")
data = [line.strip() for line in myfile_update.readlines()]
data[1] = "Sorry! The content of this line has been changed!"
myfile_update.close()

myfile_update = open("myfile.txt", "w")
myfile_update.write("\n".join(data))
print("myfile.txt updated successfully!")
myfile_update.close()