def payment(balance, annualInterestRate):
    rate = annualInterestRate/12.0
    return balance/(1 + (1 - pow(1/(1+rate),11))/rate)

float_payment = payment(balance, annualInterestRate)
payment = 10*(float_payment % 10 > 0.00) + int(float_payment/10)*10

print "Lowest Payment: " + str(payment)