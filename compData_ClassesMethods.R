CLASSES & METHODS

## R is: BOTH interctive & has sys for object orientation

2 Classes:
    S3: old-style, version 3, easier to implement
    S4: new-style, more formal/rigourous, incl R 1.4.0
    ## in methods package

## CLASS = description of thing, using setClass()
    object: instance of class, created using new()
    method: fun that operates on certain class of objects
    generic fun: dispatches methods, NO computation
## METHOD = implementation of generic function for object of class
?Classes
?Methods

## ALL OBJECTS HAVE CLASS THAT CAN BE DETERMINED BY CLASS FUNCTION
class(1)
class(TRUE)
class(rnorm(100))
class("Foo")

x <- rnorm(100) ; y <- x + rnorm(100)
fit <- lm(y~x) ; class(fit) ## linear regression model, "lm" class

mean
//  function (x, ...) 
    UseMethod("mean")
    <bytecode: 0x7fbcc30b0940>
    <environment: namespace:base>
print
//  function (x, ...) 
    UseMethod("print")
    <bytecode: 0x7fbcc3297ca0>
    <environment: namespace:base>

methods("mean") ## S3 methods

## S4 equivalent of "print" is "show"
show
// function (object) 
    standardGeneric("show")
    <bytecode: 0x7fbcc334b678>
    <environment: 0x7fbcc2377828>
    Methods may be defined for arguments: object
Use  showMethods("show")  for currently available ones.
(This generic function 
    excludes non-simple inheritance; see ?setIs)

showMethods("show")

## First arg of generic function: ojbect of a class
    1) generic function checks class
    2) search appropriate method to class
    3) call method on the object
    4) search default method of generic
    5) throw error

getS3method("mean","default")
getMethod(<generic>, <signature>)

set.seed(2) ; x <- rnorm(100) ; mean(x)
head(getS3method("mean", "default"))
tail(getS3method("mean", "default"))

set.seed(3)
df <- data.frame(x=rnorm(100), y=1:100) ; sapply(df,mean)

TIME SERIES objects, plot to connect dots
set.seed(10) ; x <- rnorm(100)
x <- as.ts(x) ## convert to TIME SERIES
plot(x, col="blue")

## IF create NEW methods for classes: print/show, summary, plot
2 ways to extend: 
    write method to new class to existing generic func
    write new generic func & new methods

## WHY create NEW class?
    represent new types of data (eg, genes, space-time, hierarchy)
    new concepts/ideas
    to abstract/hide implementation details from user

## define NEW class using setClass
    specify name, data elements called "slots", use setMethod
    info about class definition using showClass

## create new class/method for polygon
setClass("polygon",
         representation(x="numeric",
                        y="numeric")) ## slots are x, y
## for "setMethod": specify generic, signature, function body
setMethod("plot", "polygon",
          function(x, y, ...) {
              plot(x@x, x@y, type="n", ...)
              xp <- c(x@x, x@x[1])
              yp <- c(x@y, x@y[1])
              lines(xp, yp)            
          })

showMethods("plot")
p <- new("polygon", x=c(1,2,3,4), y=c(2,2,3,1)) ; plot(p)
getMethod("plot")

?setOldClass




