# What time is it??

## Let's see...




The current time is Mon Oct 28 20:01:22 2013.  My favorite number is 1.0265.

## More...

First, simulate the data...

```r
x <- rnorm(100)
y <- x + rnorm(100, sd = 0.5)
```


Next, a scatterplot...

```r
par(mar = c(5, 4, 1, 1), las = 1)
plot(x, y, main = "Simulated Data", pch = 21, col = "blue", bg = "yellow")
lines(stats::lowess(y ~ x))
```

![plot of chunk scatterplot](figure/scatterplot.png) 


### ok, so...




