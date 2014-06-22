def round_higher10(amount):
    lower = int(amount/10)*10
    if amount % 10 > 0:
        return lower + 10
    else:
        return lower

def calculate_remaining(payment, balance, annualInterestRate):
    rate = annualInterestRate/12.0
    newBalance = balance
    for i in range(12):
        newBalance = newBalance - payment
        newBalance = newBalance * (1 + rate)
    return newBalance

def findPayment(balance, annualInterestRate):
    unpaid = balance
    trialPayment = round_higher10(balance/12)
    remaining = calculate_remaining(trialPayment, balance, annualInterestRate)
    if remaining < 0:
        return trialPayment
    else:
        while remaining > 0:
            trialPayment += 10
            remaining = calculate_remaining(trialPayment, balance, annualInterestRate)
        return trialPayment
    
print "Lowest Payment: " + str(findPayment(balance, annualInterestRate))