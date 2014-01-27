## apply() <- (X, margin (1=row, 2=col), function)
## rowSums, rowMeans, colSums, colMeans

x<- matrix(rnorm(5000),100,50)
head(x)
length(x)

## find maximum val in rows
apply(x,1,max)

## find quantiles
apply(x,1,quantile,probs=c(0.25,0.75))

## avg matrix in array
a <- array(rnorm(2*2*10), c(2,2,10))
apply(a, c(1,2), mean)
head(a)

rowMeans(a, dims=2)

## tapply: apply fun over subsets of vector
## function(X, INDEX= factor, list of factors, FUN)

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10) ## gl creates factors 1-3, 10 instances
tapply(x,f, mean) ## calc means of factors 1-3

## simplify=T converts output from list to vector
tapply(x,f, mean, simplify=F)

tapply(x,f, range) ## returns min & max

## split: takes vector and splits into groups by factor
## function(x, f, drop=F,...)
## x = vector, list, data frame
## f = factor (or coerced via gl), or list of factors
## drop = whether empty factor levels dropped

split(x,f) ## return LIST of 10 for each factor 1-3
lapply(split(x,f), mean) ## same as tapply(x,f,mean)

head(airquality)
s <- split(airquality, airquality$Month)
head(s)
summary(s)

f <- as.factor(airquality$Month)
levels(f)

lapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))

airs <- na.omit(airquality)
lapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")], na.rm=T))

## split on MORE than 1 level
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)

interaction(f1,f2)
str(split(x, list(f1,f2)))
str(split(x, list(f1,f2), drop=T))

## mapply: multivariate apply function in parallel
## function(FUN, ...arguments, MoreArgs=N, Simplify=T)

rep(1,4)
rep(2,3)
mapply(rep,1:2,4:3) ## same as list(rep(1,4), rep(2,3))

rnorm(5,1,2)
rnorm(1:5,1:5,0.1)
mapply(rnorm, 1:5, 1:5, 0.1)







