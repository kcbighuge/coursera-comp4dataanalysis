## PART 5: finding best hospital in state
best <- function(state,outcome) {
    fullData <- read.csv("../R/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses="character")
    column <- if (outcome == "heart attack") {
        "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (outcome == "pneumonia") {
        "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    } else {
        stop("invalid outcome")
    }
    stateData <- fullData[fullData$State==state, c("Hospital.Name", column)]
    if (nrow(stateData)==0) {
        stop("invalid state")
    }
    
    stateData[,2] <- as.numeric(stateData[,2])
    orderState <- order(stateData[column], stateData$Hospital.Name)
    as.character(stateData$Hospital.Name[orderState[1]])
}

