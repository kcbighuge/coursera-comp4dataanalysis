## Optimization routines: optim, nlm, optimzize

?optim
?nlm
?optimize

## Loop Functions: lapply, sapply, apply, tapply, mapply
## 'split' function used in conjunction with apply
## lapply: list X (coerced as.list), function FUN, other arg's
?as.list
str(rnorm)
x <- list(a=1:5, b=rnorm(10))
lapply(x,mean)

n <- 1:4
r <- lapply(n, rnorm)
lapply(r, mean)

str(runif)
lapply(n, runif)
lapply(n, runif, min=0, max=100)

x <- list(a=matrix(1:4, 2, 2), b=matrix(1:6, 3, 2))
x
lapply(x, function(elt) elt[,1])

sapply(n, runif)
sapply(x, function(elt) elt[,1])
sapply(r, mean)

?quantile
str(quantile)
str(sapply)
x <- list(rnorm(100), runif(100), rpois(100,1))
sapply(x, quantile, probs =c(0.25, 0.75))
str(x)






