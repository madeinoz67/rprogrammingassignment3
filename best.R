## R-Programming Week 3 Assignment 3
##  Stephen Eaton <seaton@strobotics.com.au>
##

## Setup our environment
setwd("~/Documents/Coursera/RProgramming/assignment3")

## function:    best
## ourpose:     Check that state and outcome are valid
##              Return hospital name in that state with lowest 30-day death
##              rate
## assumptions: data file "outcome-of-care-measures.csv" in working Directory
best <- function(state, outcome) {
        
        ## Read outcome data
        dat_outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        
        ## Return hospital name in that state with lowest 30-day death rate
        
}