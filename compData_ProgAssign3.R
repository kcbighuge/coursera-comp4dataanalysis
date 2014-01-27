outcome <- read.csv("../R/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses="character")
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)

head(outcome[,11])
## data originally added as character, colClasses="character"
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11], xlab="30-day Death Rate", main="Heart Attack")
outcome[,17] <- as.numeric(outcome[,17])
outcome[,23] <- as.numeric(outcome[,23])

par(mfrow=c(3,1))
hist(outcome[,11], xlab="30-day Death Rate", main="Heart Attack", xlim=c(0,20))

hist(outcome[,17], xlab="30-day Death Rate", main="Heart Failure")
hist(outcome[,23], xlab="30-day Death Rate", main="Pneumonia")

stx <- table(outcome$State)
st20 <- names(stx)[stx>=20]
outcome2 <- outcome[outcome$State %in% st20,]

death <- outcome2[,11]
state <- outcome2$State
boxplot(death~state, ylab="30-day Death Rate", main="Heart Attack 30-day Death Rate by State")

## PART 4: plot death rates & number patients
outcome <- read.csv("../R/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses="character")
hospital <- read.csv("../R/ProgAssignment3-data/hospital-data.csv", colClasses="character")
head(hospital)
ncol(hospital)
nrow(hospital)

    ## merge data sets
outcome.hospital <- merge(outcome, hospital, by="Provider.Number")
death <- as.numeric(outcome.hospital[,11]) ## heart attack
npatient <- as.numeric(outcome.hospital[,15]) ## num patients
owner <- factor(outcome.hospital$Hospital.Ownership)

library(lattice)
xyplot(death~npatient|owner, xlab="Number Patients", ylab="30-day Deaths", main="Heart Attack Death by Ownership", panel = function(x,y) {
    panel.xyplot(x,y)
    panel.lmline(x,y)
    
})



