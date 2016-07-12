## R-Programming Week 3 Assignment 3  part 
##  Stephen Eaton <seaton@strobotics.com.au>
##

## Setup our environment
#setwd("~/Documents/Coursera/RProgramming/assignment3")

##  function:   rankhospital
##   purpose:   Checks that state and outcome are valid
##              Return hospital name in that state with the given rank
##              30-day death rate
## assumptions: data file "outcome-of-care-measures.csv" in working Directory
rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
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
        


}