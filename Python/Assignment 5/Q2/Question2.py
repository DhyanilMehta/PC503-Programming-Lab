STRING = '''You have received first email from abc@gmail.com, You have received second email from def@gmail.com, 
You have received third email from pqr@gmail.com, You have received fourth email from qwert@gmail.com, 
You have received fifth email from spam@gmail.com'''

# i) Display the list of unique words in the above input using set data structure.
wordsList = STRING.split()
wordsList = [word.strip(',') for word in wordsList]

uniqueWords = {word for word in wordsList}
print("List of unique words in given STRING: ")
print(uniqueWords)
print()

# ii) Display the count of each unique word.
for uniqueWord in uniqueWords:
    # count = 0
    # for word in wordsList:
    #     if word == uniqueWord:
    #         count += 1
    print("Count of " + uniqueWord + " in given STRING is " + str(wordsList.count(uniqueWord)))

# iii) Display the list of unique bigrams in the above text and their counts using set data structure.
bigramsList = [wordsList[i]+' '+wordsList[i+1] for i in range(len(wordsList) - 1)]
uniqueBigrams = {bigram for bigram in bigramsList}

print("\nList of unique bigrams in given STRING: ")
print(uniqueBigrams)
print()
for uniqueBigram in uniqueBigrams:
    # count = 0
    # for bigram in bigramsList:
    #     if bigram == uniqueBigram:
    #         count += 1
    print("Count of " + uniqueBigram + " in given STRING is " + str(bigramsList.count(uniqueBigram)))
