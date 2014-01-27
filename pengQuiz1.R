hw1 <- read.csv("hw1_data.csv")
setwd("~/Documents/R")
getwd()

ls()
rm(list=ls())

str(hw1)
names(hw1)
mine <- subset(hw1, Ozone >31 | Temp>90)
str(mine)
mean(mine$Solar.R)

newb <- subset(hw1, Month==5)
mean(newb$Temp)
max(newb$Ozone, na.rm=T)
str(newb)


