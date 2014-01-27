DATES & TIMES
dates = num days since 19700101, time=sec
POSIXct= num secondes, POSIXlt= list of time elements

x <- as.Date("1970-01-10") ## print as character
unclass(x) ## 9 days after 1970-01-01

y <- Sys.time() ; y
p <- as.POSIXlt(y) ; names(unclass(p)) ; p$sec
unclass(y)
y$sec ## error, $ operator invalid for atomic vectors

## strptime: convert character to time objects
dates <- c("January 10, 2013 10:40")
x <- strptime(dates, "%B %d, %Y %H:%M") ; x ; class(x)

x <- as.Date("2013-01-01")
y <- as.Date("2012-01-01") ; y-x

x <- as.POSIXct("2013-01-01 01:00:00")
y <- as.POSIXct("2013-01-01 01:00:00", tz="GMT") #Greenwich mean t
y-x ## diff = -8 hours





