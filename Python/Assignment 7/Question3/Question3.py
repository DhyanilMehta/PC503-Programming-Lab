file = open("myfile.txt", 'r')
data = file.read()
file.close()
print("Original Content of myfile.txt:")
print(data)

data = "\n".join(data.split())
print("Updated data to be updated in myfile.txt:")
print(data)

file = open("myfile.txt", 'w')
file.write(data)
file.close()
print("Updated myfile.txt successfully!")
