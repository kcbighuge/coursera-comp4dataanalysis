Math symbols are "expressions" in R
?plotmath
library(ggplot2)

plot(0, 0, main=expression(theta==0), ylab=expression(hat(gamm)==0), xlab=expression(sum(x[i]*y[i], i==1, n)))

x <- rnorm(100)
hist(x, xlab=expression("The MEAN (" *bar(x)* ") is " * sum(x[i]/n, i==1, n)))

x<- rnorm(100)
y<- x + rnorm(100, sd=0.5)
plot(x,y, 
     xlab=substitute(bar(x) == k, list(k=mean(x))), 
     ylab=substitute(bar(y) == k, list(k=mean(y)))
     )
mean(x)


par(mfrow = c(2,2))
for(i in 1:4) {
    x <- rnorm(100)
    hist(x, main=substitute(theta==num, list(num=i)))
}
hist(x,main=expression(theta))

## USEFUL Help Topics
?par
?plot
?xyplot
?plotmath
?axis


library()
library(nlme)
library(lattice)
xyplot(y~x | Time, BodyWeight)
head(BodyWeight)


