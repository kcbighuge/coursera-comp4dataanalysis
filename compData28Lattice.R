## Lattice package, create plots in one function call
## xyplot, bwplot, hist, stripplot, dotplot, splom, levelplot

library(lattice)
library(nlme)
ls()

bwplot(x,y)
str(bwplot)
?bwplot
?xyplot

xyplot(distance ~ age | Subject, data =Orthodont, type="b")

## lattice functions return object class trellis

x <- rnorm(100)
y <- x + rnorm(100, sd=0.5)
f <- gl(2, 50, labels=c("Group 1", "Group 2")) ## factor levels
xyplot(y~x | f)

## adding a regression line
xyplot(y ~ x | f, 
        panel = function(x,y, ...) {
            panel.xyplot(x,y, ...)
            panel.lmline(x,y,col=2)
        })

## lattice graphics plotting demo
library(help=lattice)
data(environmental)
head(environmental)
xyplot(ozone ~ radiation, data=environmental, main="Ozone vs Rad")
xyplot(ozone~temperature, data=environmental)

## plot ozone ~ radiation using temperature quantiles as factors
summary(environmental$temperature)
temp.cut <-equal.count(environmental$temperature, 4) 
xyplot(ozone ~ radiation | temp.cut, data=environmental)
xyplot(ozone ~ radiation | temp.cut, data=environmental, layout=c(1,4))
xyplot(ozone ~ radiation | temp.cut, data=environmental, layout=c(1,4), as.table=T)
xyplot(ozone ~ radiation | temp.cut, data=environmental, as.table=T, pch=20, 
    panel = function(x,y, ...) {
        panel.xyplot(x,y, ...)
        fit <- lm(y ~ x)
        panel.abline(fit, lwd=2)
    })

## smooth regression line
xyplot(ozone ~ radiation | temp.cut, data=environmental, as.table=T, pch=20, 
       panel = function(x,y, ...) {
           panel.xyplot(x,y, ...)
           panel.loess(x,y, ..., col="red", lwd=2)
       }, xlab="SolarRad", ylab="Ozone", main="Oz vs Rad, Biatch")

## see ozone, rad varation with wind
wind.cut <- equal.count(environmental$wind, 4)
xyplot(ozone ~ radiation | wind.cut, data=environmental, as.table=T, pch=20, 
       panel = function(x,y, ...) {
           panel.xyplot(x,y, ...)
           panel.loess(x,y, ..., col="red", lwd=2)
       }, xlab="SolarRad", ylab="Ozone", main="Oz vs Rad, Biatch")

## see ozone, rad variation with wind & temp
xyplot(ozone ~ radiation | temp.cut * wind.cut, data=environmental, as.table=T, pch=20, 
       panel = function(x,y, ...) {
           panel.xyplot(x,y, ...)
           panel.loess(x,y, ..., col="red", lwd=2)
       }, xlab="SolarRad", ylab="Ozone", main="Oz vs Rad, Biatch")

## see all possible combinations in dataset
splom(~environmental)
histogram(~temperature, data=environmental)
histogram(~temperature | wind.cut, data=environmental)
histogram(~ozone | wind.cut, data=environmental)
histogram(~temperature | wind.cut * temp.cut, data=environmental)
histogram(~ozone| wind.cut * temp.cut, data=environmental)

stripplot(~temperature, data=environmental)
dotplot(~temperature, data=environmental)




