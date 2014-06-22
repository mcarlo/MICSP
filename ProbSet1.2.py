def count_bobs(s):
    bobCount = 0
    for i in range(len(s)-2):
        if s[i] == 'b':
            if s[i+1] == 'o':
                if s[i+2] == 'b':
                    bobCount += 1
    return 'Number of times bob occurs is: ' + str(bobCount)
    
print 'Number of times bob occurs is: '+count_bobs(s)