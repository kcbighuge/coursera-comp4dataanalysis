## Functions are "first class objects" and treated like others
## function can be passed as args to other functions
## functions can be nested, 'return value' = last expression
## functions 'named arguments' and potential 'default val'
## 'formal arguments' included in function definition

args(sd)
str(sd)
?sd
str(rnorm)

mydata <- rnorm(100)
sd(mydata)

args(lm)
## first 5 'lm' args have NO default value

f <- function(x, y, z=2) {
    x1 <- x + rnorm(length(x), z)
    y + x1
}

f(100, 0, 10)

## Arguments evaluated lazily (only used as needed)
f <- function(a, b) {

library(datasets)
data(iris)
?iris
head(iris)

str(subset)
virg1 <- subset(iris, Species == 'virginica')
summary(virg1)

str(apply)
apply(iris, 2, mean)

data(mtcars)
?mtcars
?mean
x <- sapply(split(mtcars$hp, mtcars$cyl), mean)
summary(mtcars)
str(split)
?split
x
x[1]-x[3]

?lapply

f <- function(x) {
    g <- function(y) {
      y+z
    }
    z <- 4
    x + g(x)
}
z <- 20
f(3)

ls()
?debug

f <- function(a, b) {
    print(a)
    print(b)
}
f(45)

## ... argument indicates variable num of args passed to fun
args(plot.default)
mean

## ... is necessary when num of args passed unknown ex ante
## any args AFTER ... must be explicitly named, not partial
args(paste)
args(cat)

paste("a", "b", sep=":")
paste("a", "b", se=":")









