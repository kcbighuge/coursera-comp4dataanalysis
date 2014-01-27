## Programming Assignment 4: agecount
agecount <- function(age=NULL) {
    if (is.null(age)) {
        stop("age can't be null")
    }
    hom <- readLines("homicides.txt")
    r <- regexec(" ([0-9]+) [Yy]ears? old", hom)
    m <- regmatches(hom,r)
    a <- sapply(m, function(x) as.integer(x[2]))
    
    print(length(which(age==a)))

}


