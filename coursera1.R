setwd('~admin/Documents/R')
getwd()
list.files()
str(.Platform)
version
dir()
ls()
source("temp.R") ## access functions & variable form .R file
rm(list=ls())


m <- matrix(rnorm(100), 10, 10)
str(m)

myFun <- function(x) {
    y <- rnorm(100)
    mean(y)
}

second <- function(x) {
  x + length(x)
}

myFun(100)
second(11235)

x <- 100
length(x)

initial <- read.table("hw1_data.csv", sep=",", nrows=10)
classes <- sapply(initial, class)
x <- read.table("hw1_data.csv", sep=",", colClasses=classes)
head(x)

y <- file("hw1_data.csv", "r")
y1 <- read.table(y, sep=",")
close(y)
head(y1)

con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
close(con)
head(x)
str(x)
summary(x)


hw1 <- read.csv("hw1_data.csv")
head(hw1,2)
str(hw1)
nrow(hw1)
tail(hw1,2)
hw1[47,"Ozone"]
is.na(hw1[,"Ozone"])
sum(is.na(hw1[,"Ozone"]))

mean(hw1[,"Ozone"], na.rm=T)
mean(hw1$Solar.R, na.rm=T)

subbin <- subset(hw1, Ozone>31)
str(subbin)

subbin <- complete.cases(hw1)
head(subbin)

str(hw1[subbin,])


