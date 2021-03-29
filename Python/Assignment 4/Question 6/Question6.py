STRING = '''You have received first email from abc@gmail.com, You have received second email from def@gmail.com, 
You have received third email from pqr@gmail.com, You have received fourth email from qwert@gmail.com, 
You have received fifth email from spam@gmail.com'''

words = STRING.split(' ')
uniqueWords = []
uniqueWordsCount = []

# Sub-question 1 and 2
for word in words:
    word = word.strip()
    word = word.replace(',', '')
    if word not in uniqueWords:
        uniqueWords.append(word)
        uniqueWordsCount.append(1)
    else:
        uniqueWordsCount[uniqueWords.index(word)] += 1

print("1) List of all unique words:", uniqueWords)
print("\n2) Count of all unique words:", uniqueWordsCount)

# Sub-question 3
uniqueBigrams = []
uniqueBigramsCount = []
for i in range(len(words) - 1):
    word1 = words[i].strip()
    word2 = words[i+1].strip()
    bigram = word1.replace(',', '') + ' ' + word2.replace(',', '')

    if bigram not in uniqueBigrams:
        uniqueBigrams.append(bigram)
        uniqueBigramsCount.append(1)
    else:
        uniqueBigramsCount[uniqueBigrams.index(bigram)] += 1

print("\n3) List of all unique bigrams:", uniqueBigrams)
print("Count of all unique bigrams:", uniqueBigramsCount)
