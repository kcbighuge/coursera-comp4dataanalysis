## Plotting: graphics, lattice, grid, grDevices
## graph: plot, hist, boxplot, ...
## lattice: Trellis graphics, xyplot, bwplot, levelplot
## grid: lattice build ON TOP of grid, seldom call directly
## grDevices: graphics devices, X11, pdf, postscript, PNG
  ## Unix: X11, Win: windows, Mac: quartz

## Base: constucted piecemeal, each aspect via series of calls
## Lattice/Grid: create in one function call, specified at once

dev.off() ## close graphics device
x <- rnorm(100)
hist(x)
plot(x)
str(plot)
plot(x,rpois(100,10))

?par ## base has MANY parameters
## pch: plotting char/symbol, def = open circle
## lty: line type, def = solid line
## lwd: line wideth, as integer
## col: color, def = open circle
## las: axis label orientation

y <- x + rnorm(100)
par(las = 1) ## orient x-axis labels vert or horiz
plot(x,y)

## bg: background color
## mar: margin size
## oma: outer margin size, def = 0
## mfrow: num plots per row, col (plots filled row-wise)
## mfcol: num plots per row, col (plots filled col-wise)

par("lty") ## see default values
par("col")
par("mar") ## margins start at bottom, go clockwise
m <- c(4.1, 4.1, 4.1, 4.1)
par(mar = c(4.1, 4.1, 4.1, 4.1))

## plot: scatter plot
## lines: add lines, given vector x & y connects dots
## points: add points
## text: add text labels
## title: add annotations
## mtext: add arbitrary text to margins (inner/outer)
## axis: add axis ticks/labels

?lines
lines(x,y)
title("What the...", "...h")
mtext("x-men")

plot(x,y)
x1 <- rnorm(10)
y1 <- rnorm(10)
points(x1, y1, col="red", pch=16)
?pch

## create pdf file in working directory
pdf(file = "testRplot.pdf")
x <- rnorm(100)
hist(x)
dev.off()

## dev.copy: copy plot from one device to other
## dev.copy2pdf: copy plot to pdf
## dev.list: list of open graphic devices
## dev.next: switch control to next device
## dev.set: set control to specific device
## dev.off: close current device
dev.list()

x <- rnorm(100)
hist(x)
par("mar")
y <- rnorm(100)
plot(x,y)
z <- rnorm(100)
plot(x,z)
par(mar = c(4,4,3,3))

example(points) ## demo of capabilities
example(title)
example(mtext)

plot(x,z, pch=20)
title("Scatter")
text(-2,-2, "LABEL")
legend("topleft", legend="DATA", pch=20)
fit <- lm(z~x)
abline(fit)
abline(fit, lwd=3, col="blue")

plot(x,y,xlab="weight", ylab="height", main="SCATTER", pch=20)
legend("topright", legend="DATA", pch=20)
abline(fit, lwd=3, col="red")

z <- rpois(100,2)
par(mfrow=c(2,1)) ## 2 row/1 col, 2 per col
par(mfrow=c(1,2)) ## 1 row/2 col, 1 per col
plot(x,y, pch=20)
plot(x,z, pch=19)
par("mar")
par(mar = c(4,2,2,2))

y <- x + rnorm(100)
g <- gl(2,50, labels = c("M", "F"))
plot(x,y, type="n")  ## plot empty graph
points(x[g=="M"], y[g=="M"], col="green", pch=20)
points(x[g=="F"], y[g=="F"], col="blue", pch=19)












