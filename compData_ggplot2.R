# Plotting in Base: can't go back once plot started, need to plan
    ## difficult to translate to others, just series of R cmds
Plotting in Lattice: create graph with single call
    ## good for many plots on page, can be awkward to call once
    ## annotation not intuitive, cannot "add" to plot
ggplot2: split diff b/w base and lattice
    ## automatically deals w/ spacing, txt, titles + you can add
qplot(): quick-plot, similar to plot()
    ## look for data in data.frame, use aesthetics & geoms
Factors: indicate subsets of data, should LABEL
ggplot(): core function, more flexible than qplot()

library(ggplot2)
str(mpg) 
qplot(displ, hwy, data=mpg)
qplot(displ, hwy, data=mpg, color=drv) ## add color
qplot(displ, hwy, data=mpg, geom=c("point", "smooth")) ## loess
qplot(hwy, data=mpg, fill=drv) ## histogram

Facets: similar to Panels, look at plots together
qplot(displ, hwy, data=mpg, facets=drv~class, color=drv) ## draw horiz
qplot(hwy, data=mpg, facets=drv~., binwidth=2) ## draw vert

str(iris)
qplot(Sepal.Length, data=iris, fill=Species)
qplot(Sepal.Length, data=iris, geom="density")
qplot(Sepal.Length, data=iris, geom="density", color=Species)

qplot(Sepal.Length, Petal.Length, data=iris)
qplot(Sepal.Length, Petal.Length, data=iris, shape=Species)
qplot(Sepal.Length, Petal.Length, data=iris, color=Species)
qplot(Sepal.Length, Petal.Length, data=iris, color=Species, geom=c("point", "smooth"), method="lm")
qplot(Sepal.Length, Petal.Length, data=iris, color=Species, geom=c("point", "smooth"))

qplot(Sepal.Length, Petal.Length, data=iris, geom=c("point", "smooth"), method="lm", facets=.~Species)

## ggplot: "grammar of graphics" (theory to build on)
Components: data frame, aesthetic mapping, geoms, facets, ...
... stats, scales, coordinate system
## built in LAYERS: plot + overlay summary + metadata & annotation
data()
str(CO2)
qplot(conc, uptake, data=CO2, facets=.~Treatment, geom=c("point", "smooth"), method="lm")
head(CO2)

g <- ggplot(CO2, aes(uptake, conc)) ## initial call w/ aesthetics
summary(g) ## faceting: null

p <- g + geom_point() ## add geoms
print(p)

g + geom_point() + geom_smooth() ## default to loess
g + geom_point() + geom_smooth(method="lm") ## linear model

## add layer: FACETS
g + geom_point() + facet_grid(.~Treatment) + geom_smooth(method="lm") 

Annotation: Labels: xlab(), ylab(), labs(), ggtitle()
geom functions have options
for global: use theme()
Standard appearance themes: theme_gray(), theme_bw()

g + geom_point(color="steelblue", size=4, alpha=1/2) + geom_smooth(method="lm", color="red", size=2)
g + geom_point(aes(color=Treatment), size=4, alpha=1/2) + geom_smooth(method="lm", color="red")
g + geom_point(aes(color=Treatment)) + labs(title="CO2, Baby!") + labs(x="uptake it", y="concate") + geom_smooth(method="lm", color="red")
g + geom_point(aes(color=Treatment)) + labs(title="CO2, Baby!") + labs(x="uptake it", y="concate") + geom_smooth(method="lm", color="red", linetype=3, se=F, size=2)

## AXIS LIMITS
testdat <- data.frame(x=1:100, y=rnorm(100))
head(testdat)
testdat[50,2] <- 100 ## OUTLIER!!!
plot(testdat$x, testdat$y, type="l", ylim=c(-3,3))
plot(testdat$x, testdat$y, type="l")

g <- ggplot(testdat, aes(x=x, y=y))
g + geom_line()
g + geom_line() + ylim(-3,3) ## subsets data & removes outlier from plot
g + geom_line() + coord_cartesian(ylim=c(-3,3))

Using the cut() function
str(CO2)
cutpoints <- quantile(CO2$conc, seq(0,1, length=4), na.rm=T)
CO2$concdec <- cut(CO2$conc, cutpoints)
levels(CO2$concdec)
str(CO2$concdec)

CO2$logconc <- log(CO2$conc)
g <- ggplot(CO2, aes(uptake, logconc))
g + geom_point(alpha=1/3) + facet_wrap(Treatment~concdec, nrow=2) + geom_smooth(method="lm") + theme_gray(base_size=9)


