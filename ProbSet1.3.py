s = 'nfbooheg'

def findLongest(s):
    longest = s[0]
    temp = s[0]
    for i in range(len(s)-1):
        if s[i+1] >= s[i]:
            temp = temp + s[i+1]
            if len(temp) > len(longest):
                longest = temp
        else:
            temp = s[i+1]
    return longest
    
print "Longest substring in alphabetical order is: "+findLongest(s)

s = 'mossoymrjrphjwfmu'
print "Longest substring in alphabetical order is: "+findLongest(s)

s = 'rlgubnxxqguekxfpkxcsr'
print "Longest substring in alphabetical order is: "+findLongest(s)


s = 'xxegpudijgox'
print "Longest substring in alphabetical order is: "+findLongest(s)


s = 'pcdvcvhjmxgqssidcwppfim'
print "Longest substring in alphabetical order is: "+findLongest(s)


s = 'fxdwjqzvepnqlzayjmssjq'
print "Longest substring in alphabetical order is: "+findLongest(s)


s = 'cfemletslwqst'
print "Longest substring in alphabetical order is: "+findLongest(s)


s = 'abcdefghijklmnopqrstuvwxyz'
print "Longest substring in alphabetical order is: "+findLongest(s)


s = 'bhalngvsebphykhqjqcvei'
print "Longest substring in alphabetical order is: "+findLongest(s)


s = 'pheacirfeowkax'
print "Longest substring in alphabetical order is: "+findLongest(s)


