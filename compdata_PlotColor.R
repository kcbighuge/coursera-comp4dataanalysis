## PLOTTING & COLOR
library(grDevices)
colorRamp: palette of colors, values b/w 0 and 1
colorRampPalette: takes integer, returns vector of colors

colors()
?colors

pal <- colorRamp(c("red", "blue"))
pal(0) ## returns red (255,0,0) in rgb color scheme
pal(1) ## returns blue (0,0,255)
pal(.5) ## (127.5, 0, 127.5)

pal(seq(0,1, len=10)) ## sequence of 10 numbers, from red to blue

## colorRampPalette
pal <- colorRampPalette(c("red", "blue"))
pal(2) ## returns character vector of #FF0000 & #0000FF
pal(10) ## returns vector of 10 hexadecimal colors

pal <- colorRampPalette(c("red", "yellow", "blue"))
x <- rnorm(1000)
plot(x, col=pal(1000), pch=19)

library(RColorBrewer)
?RColorBrewer ## only use brewer.pal() function
## 3 Types of Palettes: sequential, diverging, qualitative
sequential: light to dark in 1 hue
qualitative: no ordering, different hues+shades
diverging: dark to light to dark across 2 hues

cols <- brewer.pal(3, "BuGn") ## (num of colors, palette choice)
pal <- colorRampPalette(cols)
image(volcano, col=pal(10))

## smoothScatter: plot MANY points & dont want just dots
x <- rnorm(1000)
y <- rnorm(1000)
smoothScatter(x,y) ## default to BLUE palette

rgb() function: takes numbers 0 to 1, returns hexadecimal string
rgb() alpha parameter: add transparency, 0 to 1
library(colorspace)

Scatterplot, NO transparency
plot(x,y, pch=19) ## NO definition b/w points
plot(x,y, pch=19, col = rgb(0,0,0,0.2))
rgb(0.1,0,1, alpha=0.5)



