rankhospital <- function(state, outcome, num="best") {
    ## read data
    fullData <- read.csv("../R/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses="character")
    ## check outcome is valid
    column <- if (outcome == "heart attack") {
        "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (outcome == "pneumonia") {
        "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    } else {
        stop("invalid outcome")
    }
    ## check state is valid
    stateData <- fullData[fullData$State==state, c("Hospital.Name", column)]
    if (nrow(stateData)==0) {
        stop("invalid state")
    }
    ## order stateData by death rate
    stateData[,2] <- as.numeric(stateData[,2])
    orderState <- order(stateData[column], stateData$Hospital.Name, na.last=NA)
    
    if (num=="best") {
        as.character(stateData$Hospital.Name[orderState[1]]) 
    } else if (is.numeric(num)) {
        as.character(stateData$Hospital.Name[orderState[num]])      
    } else if (num=="worst") {
        as.character(stateData$Hospital.Name[orderState[length(orderState)]]) 
    } else { stop("invalid num") }
}

rankhospital("TX", "heart failure", 4)

