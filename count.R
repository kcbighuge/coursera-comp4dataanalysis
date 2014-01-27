## ProgAssignment 4
count <- function(cause = NULL) {
    if (is.null(cause)) {
        stop("cause can't be null")
    }
    ok <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown")
    if (cause %in% ok) {    
        hom <- readLines("homicides.txt")
        r <- regexec("<dd>[Cc]ause:.*?</dd>", hom)
        m <- regmatches(hom,r)
        c <- tolower(gsub("</?dd>([Cc]ause: *)?", "", m))
        
        print(length(which(c==cause)))
    } else {
        stop("cause not found")
    }
}
x

