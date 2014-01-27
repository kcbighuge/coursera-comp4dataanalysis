# Making Tables

## The Code


```r
library(datasets)
data(airquality)
fit <- lm(Ozone ~ Wind + Temp + Solar.R, data = airquality)
plot(fit)
```

![plot of chunk fitmodel](figure/fitmodel1.png) ![plot of chunk fitmodel](figure/fitmodel2.png) ![plot of chunk fitmodel](figure/fitmodel3.png) ![plot of chunk fitmodel](figure/fitmodel4.png) 


Here is the table:


```r
library(xtable)
xt <- xtable(summary(fit))
print(xt, type = "html")
```

<!-- html table generated in R 3.0.1 by xtable 1.7-1 package -->
<!-- Mon Oct 28 20:16:33 2013 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> Estimate </TH> <TH> Std. Error </TH> <TH> t value </TH> <TH> Pr(&gt |t|) </TH>  </TR>
  <TR> <TD align="right"> (Intercept) </TD> <TD align="right"> -64.3421 </TD> <TD align="right"> 23.0547 </TD> <TD align="right"> -2.79 </TD> <TD align="right"> 0.0062 </TD> </TR>
  <TR> <TD align="right"> Wind </TD> <TD align="right"> -3.3336 </TD> <TD align="right"> 0.6544 </TD> <TD align="right"> -5.09 </TD> <TD align="right"> 0.0000 </TD> </TR>
  <TR> <TD align="right"> Temp </TD> <TD align="right"> 1.6521 </TD> <TD align="right"> 0.2535 </TD> <TD align="right"> 6.52 </TD> <TD align="right"> 0.0000 </TD> </TR>
  <TR> <TD align="right"> Solar.R </TD> <TD align="right"> 0.0598 </TD> <TD align="right"> 0.0232 </TD> <TD align="right"> 2.58 </TD> <TD align="right"> 0.0112 </TD> </TR>
   </TABLE>


###  you like? Here are more common options...
#### Output:
    results: "asis", "hide"
    echo: TRUE, FALSE
#### Figures:
    fig.height: numeric
    fig.width; numeric

<br />
## Here we add inline text as in emails:
> This is the first level
>
>> This is nested...
>
> Back to the first level






