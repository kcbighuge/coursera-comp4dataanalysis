## message: generic diagnostic
## warning: something wrong, not fatal
## error: fatal problem, execution stops
## condition: something unexpected can occur

log(-1)
mean(x)
traceback()

set.seed(1) ## seeds random number generator
rpois(22,3)

printmsg <- function(x) {
  if(x>0) 
    print("x is big")
  else
    print("x is small")
  invisible(x)
}
printmsg(-.3)
printmsg(NA)

print2 <- function(x) {
  if(is.na(x))
    print("x is missing")
  else if(x>0) 
    print("x is big")
  else
    print("x is small")
  invisible(x)
}
print2(NA)


## traceback: prints function call stack, nothing if no error
## debug: flags fun for debug mode, step one line at time
## browser: suspends fun when called, puts fun in debug mode
## trace: insert debugging code into FUN at specific places
## recover: modify error behavior to browse function call stack

rm(x)
mean(x)
traceback()

lm(y~x)
traceback()

debug(lm)
lm(y~x)
undebug(lm)
lm(y~x)

options(error=recover)
options(error=NULL)
read.csv("nosuchfile")








