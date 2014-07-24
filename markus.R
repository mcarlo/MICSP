# Course project
# Examine the following two questions:
# 1. Is an automatic or manual transmission better for MPG?
# 2. Quantify the difference
#
# Ensure permitted packages are available
#
library("base")
library("compiler")
library("datasets")
library("graphics")
library("grid")
library("grDevices")
library("knitr")
library("methods")
library("parallel")
library("splines")
library("stats")
library("stats4")
library("tcltk")
#
# Import data
data <- mtcars

# Figure 1: Boxplot showing motivation for analysis
par(mfrow = c(1, 1))

boxplot(mpg ~ am, data = data, varwidth = TRUE, 
        col = "lightgray", names = c("Manual","Automatic"))
title(main = "Figure 1. Miles per Gallon vs. Transmission Type\n (mtcars data)", 
      xlab = "Transmission Type", ylab = "Miles per Gallon")

tapply(data$mpg, data$am, mean) # 17.1, 24.4



# Describe data
# Data consists of fuel efficiencey and 10 other measurements for 32 different car models published by 
# Motor Trends in 1974. Measurements include:
# mpg
# cyl
# disp
# hp
# drat
# wt
# qsec
# vs
# am
# gear
# carb

# Cars included models from US and non-US manufacturers

# Several are clearly related to fuel efficiency. That wt should be negatively 
# related seems intuitively obvious. What else is related?
#
fit <- lm(mpg ~ am, data)
summary(fit)
par(mfrow = c(2, 2))
plot(fit)

fit1 <- lm(mpg ~ ., data)
plot(fit1)

cor(data)

pairs(~ mpg + cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb, data =
        mtcars, main="Figure 2. Correlation Matrix\n (mtcars data)")
coplot(mpg ~ wt | as.factor(am), data = data,
       panel = panel.smooth, rows = 1)


table(data$am, data$mpg )

cor(data)
fit <- lm(mpg ~ ., data)
summary(fit)
vif(fit)
fit2 <- lm(mpg ~ cyl + hp + drat + wt + qsec + vs + am + gear + carb, data)
summary(fit2)
vif(fit2)
fit3 <- lm(mpg ~ hp + drat + wt + qsec + vs + am + gear + carb, data)
vif(fit3)
fit4 <- lm(mpg ~ drat + wt + qsec + vs + am + gear + carb, data)
vif(fit4)
fit5 <- lm(mpg ~ drat + qsec + vs + am + gear + carb, data)
vif(fit5)
fit6 <- lm(mpg ~ drat + qsec + vs + am + carb, data)
vif(fit6)
fit7 <- lm(mpg ~ drat + vs + am + carb, data)
vif(fit7)
fit8 <- lm(mpg ~ vs + am + carb, data)
vif(fit8)
summary(fit8)
pairs(mtcars, main = "mtcars data")
fit9 <- lm(mpg ~ wt + vs + am + carb, data)


pairs(~ mpg + wt + vs + am + carb,data=mtcars, 
      main="Simple Scatterplot Matrix")
coplot(mpg ~ wt | as.factor(am), data = data,
       panel = panel.smooth, rows = 1)

coplot(mpg ~ am | vs * carb, data = data,
       panel = panel.smooth, rows = 1)


fit9resid <- resid(fit9)
plot(data$mpg, fit9resid)
cor(data$mpg, fit9resid)

fit8resid <- resid(fit8)
plot(data$mpg, fit8resid)
cor(data$mpg, fit8resid)

fit5resid <- resid(fit5)
plot(data$mpg, fit5resid)
cor(data$mpg, fit5resid)
plot(data$mpg, data$wt)
plot(data$mpg, log(data$wt))
cor(data$mpg, log(data$wt))
cor(data$mpg, data$wt)

fit4a <- lm(mpg ~ drat + log(wt) + qsec + vs + am + gear + carb, data)
vif(fit4a)
resid4a <- resid(fit4a)
cor(data$mpg, resid4a)
confint(fit4a)

fit4b <- lm(mpg ~ log(wt) + vs + am + carb, data)
vif(fit4b)
resid4b <- resid(fit4b)
plot(data$mpg, resid4b)
cor(data$mpg, resid4b)
confint(fit4b)

fit <- lm(mpg ~ . , data = data);
par(mfrow = c(2, 2))
plot(fit)
round(dfbetas(fit)[,9],3)
round(hatvalues(fit),3)
plot(predict(fit))
cor(data$mpg, resid(fit))

fit1 <- lm(mpg ~ am, data = data)
a <- summary(fit1)$cov.unscaled[2,2]
fit2 <- update(fit1, mpg ~ am + vs)
fit3 <- update(fit1, mpg ~ am + vs + carb)
fit4 <- update(fit1, mpg ~ am + vs + carb + wt)
fit5 <- update(fit1, mpg ~ am + vs + carb + log(wt))

c(summary(fit2)$cov.unscaled[2,2],
  summary(fit3)$cov.unscaled[2,2],summary(fit4)$cov.unscaled[2,2],
  summary(fit5)$cov.unscaled[2,2] ) / a 

anova(fit1, fit2, fit3, fit4, fit5)

confint(fit3)
par(mfrow = c(2, 2))
plot(fit3)

rownames(data)

amerRows <- c(4, 5, 6, 7, 15, 16, 17, 22, 23, 24, 25, 29)

americans <- data[amerRows,]
foreign <- data[-amerRows,]

data$dom <- 1*(row(data)[,1] %in% amerRows)
fit <- lm(mpg ~ ., data = data)
par(mfrow = c(2, 2))
plot(fit)
summary(fit)
cor(data)
vif(fit)
fit2 <- lm(mpg ~ cyl + hp + drat + wt + qsec + vs + am + gear + carb + dom, data)
vif(fit2)
fit3 <- lm(mpg ~ hp + drat + wt + qsec + vs + am + gear + carb + dom, data)
vif(fit3)
plot(fit3)
confint(fit3)
fit4 <- lm(mpg ~ hp + drat + qsec + vs + am + gear + carb + dom, data)
vif(fit4)
fit5 <- lm(mpg ~ drat + qsec + vs + am + gear + carb + dom, data)
vif(fit5)
fit6 <- lm(mpg ~ drat + vs + am + gear + carb + dom, data)
vif(fit6)
fit7 <- lm(mpg ~ drat + vs + am + carb + dom, data)
vif(fit7)
fit8 <- lm(mpg ~ vs + am + carb + dom, data)
vif(fit8)
summary(fit8)
confint(fit8)
fit9 <- lm(mpg ~ am + carb + dom, data)
fita <- lm(mpg ~ am + vs + dom, data)
fitb <- lm(mpg ~ am + carb + dom + wt, data)
fitc <- lm(mpg ~ carb + dom + wt, data)

anova(fit, fit2, fit3, fit4, fit5, fit6, fit7, fit8, fit9, fita, fitb, fitc)

summary(fitb)
confint(fitb)
par(mfrow = c(2, 2))
plot(fitb)


pairs(~ mpg + am + carb + dom,data=data, 
      main="Simple Scatterplot Matrix")
coplot(mpg ~ am | dom + carb, data = data,
       panel = panel.smooth, rows = 1)


rownames(data)
data$country[rownames(data) %in% c("Mazda RX4","Mazda RX4 Wag","Datsun 710","Honda Civic","Toyota Corolla","Toyota Corona")] <- "Japan"
data$country[rownames(data) %in% c( "Hornet 4 Drive", "Hornet Sportabout", 
                                    "Valiant", "Duster 360", 
                                    "Cadillac Fleetwood", "Lincoln Continental",
                                    "Chrysler Imperial", "Dodge Challenger",
                                    "AMC Javelin", "Camaro Z28",
                                    "Pontiac Firebird", "Ford Pantera L")] <- "USA"
data$country[rownames(data) %in% c("Merc 240D", "Merc 230", "Merc 280", 
                                   "Merc 280C", "Merc 450SE", "Merc 450SL", 
                                   "Merc 450SLC", "Porsche 914-2")] <- "Germany"
data$country[rownames(data) %in% c("Fiat 128", "Fiat X1-9", "Ferrari Dino", 
                                   "Maserati Bora")] <- "Italy"
data$country[rownames(data) == "Lotus Europa"] <- "England"
data$country[rownames(data) == "Volvo 142E"] <- "Sweden"

fitC <- lm(mpg ~ ., data)
outlierTest(fitC)

summary(fitC)
plot(fitC)
vif(fitC)


fitC2 <- lm(mpg ~ cyl + hp + drat + wt + qsec + vs + am + gear + carb + country, data)
vif(fitC2)
fitC3 <- lm(mpg ~ hp + drat + wt + qsec + vs + am + gear + carb + country, data)
vif(fitC3)
fitC4 <- lm(mpg ~ hp + drat + wt + vs + am + gear + carb + country, data)
vif(fitC4)
fitC5 <- lm(mpg ~ hp + drat + wt + vs + am + carb + country, data)
vif(fitC5)
fitC6 <- lm(mpg ~ wt + vs + am + carb + country, data)
vif(fitC6)
anova(fitC6)
summary(fitC6)
fitC7 <- lm(mpg ~ vs + am + carb + country, data)
vif(fitC7)
anova(fitC7)
confint(fitC7)
fitC8 <- lm(mpg ~ wt + am + carb + country, data)
vif(fitC8)
anova(fitC8)
summary(fitC8)
summary(fitC7)
confint(fitC7)
plot(fitC7)

boxplot(mpg ~ am, data = data,
        xlab = "Transmission Type (1 = Auto)", ylab = "Miles per Gallon",
        main = "Motor Trend Cars Data", varwidth = TRUE, col = "lightgray")

coplot(mpg ~ wt | as.factor(am), data = data,
       panel = panel.smooth, rows = 1)
