## R-Programming Week 3 Assignment 3  part 4
##  Stephen Eaton <seaton@strobotics.com.au>
##

## external libraries
library(plyr)

##  function:   rankall
##   purpose:   Checks that outcome is valid
##              Return hospital names in all states with the given rank
##     
## assumptions: data file "outcome-of-care-measures.csv" in working Directory
rankall <- function(outcome, num = "best") {
        ## Read outcome data
        df <- read.csv("outcome-of-care-measures.csv", 
                       na.strings= "Not Available",
                       stringsAsFactors=FALSE)
        
        valid_outcomes <- c("heart attack" = 11, 
                            "heart failure" = 17, 
                            "pneumonia" = 23 ) 
        
        ## Check that outcome parameter is valid
        if(!is.element(outcome, names(valid_outcomes))) {
                stop("invalid outcome")
        }
        
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        
        ## required number of columns and rename to something legible
        df <- df[, c(2,  7, valid_outcomes[outcome])]
        names(df) <- c("hospital", "state", "outcome")
        df <- arrange(df, state, outcome, hospital,na.last = TRUE)
        
        ## remove any rows with invalid data (NA)
        df <- na.omit(df)
        
        
        ## function called by ddply
        rank_hosp <- function(x){
                if(num == "best") {
                      x[1,c("hospital","state")]
                } else if(num == "worst"){
                        x[nrow(x), c("hospital","state")]
                } else {
                        x[num, c("hospital","state")] 
                }  
        }
        
        split_by_state <- ddply(df, .(state), rank_hosp)
        
        split_by_state

}