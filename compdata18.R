## Scoping Rules

lm <- function(x) {x*x}
lm
?lm

search()
library(survival)
search()

## R uses 'lexical' or 'static' scoping, not 'dynamic' scoping
## Lexical: values of free var's searched in envir fun DEFINED
  ## see, Scheme, Perl, Python, Common Lisp
## Dynamic: val searched in environ where function CALLED
## variable 'z' is 'free variable'
## Environment: collection of symbol/value pairs
## function + an environment = closure, or function closure
f <- function(x,y) {
    x^2 + y/z
}
f(2,5)
rm(z)

make.power <- function(x, n) {
    pow <- function(x) {
      x^n
    }
    pow(x)
}
rm(x)
make.power(4, 3)

make.pow <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}
cube  <- make.pow(3)
ssq   <- make.pow(2)
cube(3)
ssq(3)

## what is in function's environment?
ls(environment(cube))
get("n", environment(cube))
get("n", environment(ssq))

y <- 10
f <- function(x) {
    y <- 2
    y^2 + g(x)
}
g <- function(x) {
    x*y
}
f(3)
y

g <- function(x, a=2) {
    x + a
}
g(2)









