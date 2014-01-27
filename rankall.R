rankall <- function(outcome, num="best") {
    ## read data
    fullData <- read.csv("../R/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses="character")
    ## check outcome is valid
    column <- if (outcome == "heart attack") {
        fullData[,11] <- as.numeric(fullData[,11])
        "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        fullData[,17] <- as.numeric(fullData[,17])
        "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (outcome == "pneumonia") {
        fullData[,23] <- as.numeric(fullData[,23])
        "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    } else {
        stop("invalid outcome")
    }

    ## split full data by state
    stateData <- split(fullData[, c("Hospital.Name", "State", column)],fullData$State)

    ## rank hospitals in state
    rankHospital <- function(stateData, num) {
        orderState <- order(stateData[3], stateData$Hospital.Name, na.last=NA)
        
        if (num=="best") {
        stateData$Hospital.Name[orderState[1]]
    } else if (is.numeric(num)) {
        stateData$Hospital.Name[orderState[num]]      
    } else if (num=="worst") {
        stateData$Hospital.Name[orderState[length(orderState)]]
    } else { stop("invalid num") }
    }
    
    ## apply ranks
    result1 <- lapply(stateData, rankHospital, num)
    data.frame(hospital=unlist(result1), state=names(result1), row.names=names(result1))
}
