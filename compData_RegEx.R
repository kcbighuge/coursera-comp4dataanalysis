REGULAR EXPRESSIONS
^ = begin line ; $ = end of line

Character Classes using []
    eg, ^[Ii] am ; ^[0-9][a-zA-z]
    [^?.]$ = match lines NOT ending in "?" or "."

. = any character ; | = "or"
? = match 0 or 1 times
.* = match ANY character ANY number of times
+ = match 1 or more times

{} = interval quantifiers
    eg, [Bb]ush(\s+[^\s]\s+){1,5}
    {m,n} = match at least "m" times, less than "n" times
    {m} = match exactly "m" times ; {m,} = match at least "m"

\1 and \2 = match at least 1 or 2 time(s) same text in matched ()
    +([a-zA-Z]+)\s+\1

* = greedy, matches LONGEST possible string
    ^s(.*?)s$ = match FIRST possible, turn off greediness

## MAIN R Reg Ex functions
grep: matches in character vector, returns indices (eg, [1,3])
    grepl: returns TRUE/FALSE vector
regexpr/gregexpr: sreturn indices where begins + length of match
sub/gsub: search & replace
regexec: 

h <- read.table("homicides.txt")
hom <- readLines("homicides.txt")
hom[1]
hom[1000]

length(grep("iconHomicideShooting",hom))
length(grep("[Hh]om[^<]*?[Ss]hoot",hom))

i <- grep("[Cc]ause: +[Ss]hootin",hom) ; str(i)
j <- grep("[Ss]hootin",hom) ; str(j)

setdiff(i,j) ## take vector i and subtract vector j
setdiff(j,i) ## subtract vector i from vector j
    returns [1] 318 859
hom[318]
hom[11]

str(state.name)
grep("^New", state.name)
grep("^New", state.name, value=T)

grepl("^New", state.name) ## gets vector length(50) of TRUE/FALSE

grep(" [Ss]tabb", hom, value=T)
length(grep(" [Ss]tabb", hom, value=T))

regexpr(" [Ss]tabb", hom) ## gets char in char string match begins
length(regexpr("[Ss]tabb", hom))
length(gregexpr("[Ss]tabb", hom))

regexpr("<dd>[Ff]ound.*</dd>", hom)
regexpr("<dd>[Ff]ound.*</dd>", hom[1:10])
substr(hom[1], 177, 177+93-1) ## gets matched string

regexpr("<dd>[Ff]ound.*?</dd>", hom[1:10]) ## finds FIRST match
r <- regexpr("<dd>[Ff]ound.*?</dd>", hom[1:10])
m <- regmatches(hom[1:10],r) ## get matches w/out substr()

x <- substr(hom[1], 177, 177+33-1) ; x
## strip all except DATE
sub("</?dd>([Ff]ound on ?)?", "", x) ## matches FIRST
gsub("</?dd>([Ff]ound on ?)?", "", x) ## matches ALL

## gsub can operate WHOLE vectors, not just substrings
d <- gsub("</?dd>([Ff]ound on ?)?", "", m)
as.Date(d, "%B %d, %Y") ## convert char vector into DATE

## regexc like regexpr, gets indices in parenthesized sub-expr's
t <- regexec("<dd>[Ff]ound on (.*?)</dd>", hom[1]) ; t
    ## returns data in (.*?)

t <- regexec("<dd>[Ff]ound on (.*?)</dd>", hom[1:5]) ; t
regmatches(hom[1:5], t)  ## return matched strings

## plot monthly counts
r <- regexec("<dd>[Ff]ound on (.*?)</dd>", hom)
m <- regmatches(hom,r)
dates <- sapply(m, function(x) x[2])
dates <- as.Date(dates, "%B %d, %Y")
hist(dates, "month", freq=T)

## plot monthly counts using gsub
r <- regexpr("<dd>[Ff]ound .*?</dd>", hom[1:500])
m <- regmatches(hom[1:500],r) ; head(m)
dates <- gsub("</?dd>([Ff]ound on ?)?", "", m) ; head(dates)
dates <- as.Date(dates, "%B %d, %Y") ; head(dates)
hist(dates, "month", freq=T)






