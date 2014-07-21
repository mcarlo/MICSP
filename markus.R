# Course project
# Examine the following two questions:
# 1. Is an automatic or manual transmission better for MPG?
# 2. Quantify the difference
#
# Ensure permitted packages are available
#
library("compiler")
library("grid")
library("parallel")
library("splines")
library("stats4")
library("tcltk")
library("knitr")
#
# Import data
data <- mtcars

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

pairs(~mpg + drat + qsec + vs + am + gear + carb,data=mtcars, 
      main="Simple Scatterplot Matrix")
coplot(mpg ~ wt | as.factor(am), data = mtcars,
       panel = panel.smooth, rows = 1)

dfbetas(fit5)
hatvalues(fit5)
