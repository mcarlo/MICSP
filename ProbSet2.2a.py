# Find the lowest payment, rounded to the nearest $10, which will pay off a 
# credit card balance after 12 months
# print out the answer as such:
#
# Lowest Payment: 180 
# 
# Input variables are:
#
# balance
#
# annualInterestRate

balance = 3329
annualInterestRate = 0.2

def monthlyRate(rate):
    return rate/12.0
    
def v(rate):
    return 1.0/(1 + monthlyRate(rate))
    
def annuityPresentValue(rate, n):
    return (1 - math.pow(v(rate), n)/monthlyRate(rate)
    
print str(balance)

#print "Lowest Payment: " + str(payment)
