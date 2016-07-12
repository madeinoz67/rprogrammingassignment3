## R-Programming Week 3 Assignment 3
##  Stephen Eaton <seaton@strobotics.com.au>
##

## external libraries
library(plyr)

## Setup our environment
setwd("~/Documents/Coursera/RProgramming/assignment3")

## function:    best
## ourpose:     Check that state and outcome are valid
##              Return hospital name in that state with lowest 30-day death
##              rate
## assumptions: data file "outcome-of-care-measures.csv" in working Directory
best <- function(state, outcome) {
        
        ## Read outcome data
        raw_df <- read.csv("outcome-of-care-measures.csv", 
                                na.strings= "Not Available",
                                stringsAsFactors=FALSE)
        
        valid_outcomes <- c("heart attack" = 11, 
                            "heart failure" = 17, 
                            "pneumonia" = 23 ) 

        ## Check that state and outcome are valid
        if(!is.element(state, raw_df$State)) {
                stop("invalid state")
        }

        if(!is.element(outcome, names(valid_outcomes))) {
                stop("invalid outcome")
        }
        
        ## create a subset of main data with only the 
        ## required number of columns and rename to something legible
        subset_raw_df <- raw_df[, c(2,  7, valid_outcomes[outcome])]
        names(subset_raw_df) <- c("hospital", "state", "outcome")
        subset_raw_df <- arrange(subset_raw_df, state, outcome, hospital)

        ## remove any rows with invalid data (NA)
        clean_df <- na.omit(subset_raw_df)

        state_result <- clean_df[clean_df$state==state,]
        state_result[1,1]
        
}