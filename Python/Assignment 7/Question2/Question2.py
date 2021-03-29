storyFile = open("story.txt", "r")
number_of_lines = 0
number_of_words = 0

for line in storyFile.readlines():
    line = line.strip("\n")
    words = line.split()
    number_of_lines += 1
    number_of_words += len(words)

storyFile.close()
print("Lines and words in story.txt: ")
print("Lines:", number_of_lines, "Words:", number_of_words)
