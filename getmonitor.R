## Part 1
getmonitor <- function(id, directory, summarize=F) {
  x <- paste((sprintf("%03.0f", id)),".csv", sep="")
  d <- paste(directory,x,sep="/")
  y <- read.csv(d)
  
  if(summarize==T) {
    return(y)
    summary(y)
  } else {
    return(y)
  }
}