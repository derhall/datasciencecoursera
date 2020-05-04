rankhospital <- function(state, outcome, num = "best") {
        ##Read outcome data
        data <-
                read.csv(
                        "R Programming/ProgAssign3/outcome-of-care-measures.csv",
                        na.strings = "Not Available",
                        stringsAsFactors = FALSE
                )
        
        oc <-
                c(
                        "heart attack" = 11,
                        "heart failure" = 17,
                        "pneumonia" = 23
                )
        ##Check that state and outcome are valid
        if (state %in% data$State) {
                
        } else {
                stop("invalid state")
        }
        
        if (outcome %in% names(oc)) {
                
        } else {
                stop("invalid outcome")
        }
        
        ##Return hospital name with the given rank 30d death-rate
        
        ### Subset the data
        df <-
                data[data$State == state, c(2, 7, oc[outcome])]
        
        ### Re-order and rank the data
        
        df <- df[order(df[, 3], df[, 1], na.last = NA),]
        
        
        ### Set the indexed rank
        if (num == "best") {
                n <- 1
        } else if(num == "worst") {
                n <- nrow(df)
        } else {
                n <- num
        }
        
        ### Call the index rank hospital name
        
        df$Hospital.Name[n]
}