corr <- function(directory, threshold=0) {
  source("/Users/admin/Documents/R/getmonitor.R")
  co <- vector()
  for (i in 1:332) {
    x <- getmonitor(i, directory)
    if (nrow(na.omit(x)) > threshold) {
        x1 <- na.omit(x)
        co <- c(co,cor(x1$sulfate,x1$nitrate))
    }
    else {
      next
    }
  }
  return(co)
}


