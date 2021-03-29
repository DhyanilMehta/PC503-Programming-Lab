STRING = '''You have received first email from abc@gmail.com, You have received second email from def@gmail.com, 
You have received third email from pqr@gmail.com, You have received fourth email from qwert@gmail.com, 
You have received fifth email from spam@gmail.com'''

# i) Display the word count using dictionary data structure.
wordsList = [word.strip(',') for word in STRING.split()]
uniqueWords = dict()

for word in wordsList:
    uniqueWords[word] = uniqueWords.get(word, 0) + 1

print("Displaying counts for each word in STRING: ")
for word, count in uniqueWords.items():
    print("Word: " + word + "\tCount: " + str(count))

# ii) Display the list of unique bigrams in the above text and their counts using dictionary data structure.
bigramsList = [wordsList[i]+' '+wordsList[i+1] for i in range(len(wordsList) - 1)]
uniqueBigrams = dict()

for bigram in bigramsList:
    uniqueBigrams[bigram] = uniqueBigrams.get(bigram, 0) + 1

print("\nDisplaying counts for each bigram in STRING: ")
for bigram, count in uniqueBigrams.items():
    print("Bigram: " + bigram + "\tCount: " + str(count))
