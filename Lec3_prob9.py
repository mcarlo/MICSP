# This script applies the bisection method to guess a user's number between
# 0 and 100. The output should read like so:
#

low = 0
high = 100
answer = 50
guess = False
print('Please think of a number between ' + str(low) + ' and ' + str(100) + '!')
while guess == False:
    print 'Is your secret number ' + str(answer) + '?'
    print "Enter 'h' to indicate the guess is too high. " + \
    "Enter 'l' to \n" + \
    "indicate the guess is too low. Enter 'c' to indicate I",
    reply = raw_input("guessed correctly. ")
    if reply not in ('c', 'h', 'l'):
        print "Sorry, I didn't understand your answer." 
    elif reply == 'c':
        guess = True
    elif reply == 'h':
        high = answer
        answer = (high + low)/2
    elif reply == 'l':
        low = answer
        answer = (high + low)/2

message = "Game over. Your secret number was: " + str(answer)
print message.lstrip(' ')
