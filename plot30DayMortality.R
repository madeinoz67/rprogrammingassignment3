## R-Programming Week 3 Assignment 3  part 1
##  Stephen Eaton <seaton@strobotics.com.au>
##

## Setup our environment
setwd("~/Documents/Coursera/RProgramming/assignment3")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
