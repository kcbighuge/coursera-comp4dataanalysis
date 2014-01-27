## Generating Random Numbers
## rnorm, dnorm (density), pnorm (cumulative distrib), rpois
## d = density, r = random num gen, p = cumulative, q=quantile

rand <- function(x) {
    x <- rnorm(10,20,2)
    print(x)
    summary(x)
}
rand()

## set.seed(1): pass any integer to reproduce same set of num's
## use set.seed() to go back and get same results
set.seed(1)
rnorm(5)
rnorm(5)

rpois(10,1)
rpois(10,100) ## mean roughly approaches lambda

ppois(2,10) ## cumulative distribution, cumulative prob x <= 2
ppois(10,10)
ppois(20,10)

## simulate linear model: y = B_0 + B_1*x + e
set.seed(11)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e
summary(y)
plot(x,y)

x <- rnorm(10,20,2)
summary(x)

x <- 1:100
e <- rnorm(100, 0, 1)
y <- 1.5 - 3*x + e
summary(y)
plot(x,y)

x <- rbinom(100,1,0.5) ## x value is binomial
e <- rnorm(100, 0, 1)
y <- 0.5 + 2*x + e
summary(y)
plot(x,y)

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + .3*x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x,y)

## sample() draws randomly from specified set
sample(1:10,4)
sample(letters,4)
sample(1:10) ## gives permutation
sample(1:10, replace=T) ## sample WITH replacement






