# calculate and display various amounts pertaining to credit card debt
#
# variables include:
#
# balance
# annualInterestRate (as a decimal)
# monthlyPaymentRate (monthly minimum payment rate as a decimal)
#
# For each month 1-12, calculate and print out the following:
# Month: (int)
# Minimum monthly payment: (float, 2)
# Remaining balance: (float, 2)
#
# Definitions for the variable calculations are:
#
# Monthly interest rate= (Annual interest rate) / 12.0
# Minimum monthly payment = (Minimum monthly payment rate) x (Previous balance)
# Monthly unpaid balance = (Previous balance) - (Minimum monthly payment)
# Updated balance each month = (Monthly unpaid balance) + 
#                              (Monthly interest rate x Monthly unpaid balance)

def monthlyRate(annualRate):
    return annualRate/12.0
    
def monthlyPayment(monthlyPaymentRate, previousBalance):
    return round(monthlyPaymentRate * previousBalance, 2)
    
def monthlyBalance(previousBalance, monthlyPayment):
    return previousBalance - monthlyPayment
        
def updatedBalance(monthlyBalance, monthlyRate):
    return round(monthlyBalance * (1 + monthlyRate), 2)
    
#monthlyPaymentRate = 0.04
#annualInterestRate = 0.2
#balance = 4842

rate = monthlyRate(annualInterestRate)
beginningBalance = balance
totalPaid = 0

for i in range(12):
    print "Month: " + str(i + 1)
    
    payment = monthlyPayment(monthlyPaymentRate, beginningBalance)
    print "Minimum monthly payment: " + str(payment)
    totalPaid += payment
    
    newBalance1 = monthlyBalance(beginningBalance, payment)
    newBalance2 = updatedBalance(newBalance1, rate)
    print "Remaining balance: " + str(newBalance2)

    beginningBalance = newBalance2 
    
print "Total paid: " + str(totalPaid)    
print "Remaining balance: " + str(beginningBalance)
