## R-Programming Week 3 Assignment 3  part 3
##  Stephen Eaton <seaton@strobotics.com.au>
##

## external libraries
library(plyr)

## Setup our environment
#setwd("~/Documents/Coursera/RProgramming/assignment3")

##  function:   rankhospital
##   purpose:   Checks that state and outcome are valid
##              Return hospital name in that state with the given rank
##              30-day death rate
## assumptions: data file "outcome-of-care-measures.csv" in working Directory
rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        df <- read.csv("outcome-of-care-measures.csv", 
                                na.strings= "Not Available",
                                stringsAsFactors=FALSE)
        
        valid_outcomes <- c("heart attack" = 11, 
                            "heart failure" = 17, 
                            "pneumonia" = 23 ) 
        
        ## Check that state and outcome are valid
        if(!is.element(state, df$State)) {
                stop("invalid state")
        }

        if(!is.element(outcome, names(valid_outcomes))) {
                stop("invalid outcome")
        }
        
        ## create a subset of main data with only the 
        ## required number of columns and rename to something legible
        df <- df[, c(2,  7, valid_outcomes[outcome])]
        names(df) <- c("hospital", "state", "outcome")
        df <- arrange(df, state, outcome, hospital)
        
        ## remove any rows with invalid data (NA)
        df <- na.omit(df)
        ## state subset
        df <- df[df$state==state,]
        
        ## output requested rank
        if(num == "best") {
                df[1,1]
        } else if(num == "worst"){
                df[nrow(df), 1]
        } else {
                df[num, 1]
        }
}