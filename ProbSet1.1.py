def isVowel(char):
    '''
    char: a single letter of any case

    returns: True if char is a vowel and False otherwise.
    '''
    # Your code here
    if char in ('a','e','i','o','u'):
        return True
    else:
        return False

def countVowels(s):
    vowelCount = 0
    for i in range(len(s)):
        if isVowel(s[i]):
            vowelCount += 1
    return 'Number of vowels: ' + str(vowelCount)
    
print "Number of vowels: " + countVowels(s)