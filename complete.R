complete <- function(directory, id=1:332) {
  source("/Users/admin/Documents/R/getmonitor.R")
  nobs <- vector()
  for (i in id) {
    x <- getmonitor(i, directory)
    nobs <- c(nobs, nrow(na.omit(x)))
  }
  d <- data.frame(id, nobs)
  return(d)
}
