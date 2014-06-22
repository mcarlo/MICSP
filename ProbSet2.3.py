def calculate_remaining(payment, balance, annualInterestRate):
    rate = annualInterestRate/12.0
    newBalance = balance
    for i in range(12):
        newBalance = newBalance - payment
        newBalance = newBalance * (1 + rate)
    return newBalance

def findPayment(balance, annualInterestRate):
    epsilon = .1
    unpaid = balance
    lower = balance/12.0
    upper = balance * pow(1 + annualInterestRate/12.0, 11) / 12.0
    trialPayment = round((upper + lower)/2.0, 2)
    remaining = calculate_remaining(trialPayment, balance, annualInterestRate)
    if abs(remaining) < epsilon:
        if remaining < 0:
            return trialPayment
    else:
        while abs(remaining) > epsilon:
            if remaining > 0:
                lower = trialPayment
            else:
                upper = trialPayment
            trialPayment = round((upper + lower)/2.0, 2)
            remaining = calculate_remaining(trialPayment, balance, annualInterestRate)
        return trialPayment

balance = 999999
annualInterestRate = 0.18

print "Lowest Payment: " + str(findPayment(balance, annualInterestRate))