rankall <- function(outcome, num = "best") {
        ## Read outcome data
        
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
        
        ## Check that the outcome is valid
        
        if (outcome %in% names(oc)) {
                
        } else {
                stop("invalid outcome")
        }
        
        ## For each state, find the hospital of the given rank
        
        ### Subset the dataset
        
        df <-
                data[, c(2, 7, oc[outcome])]
        
        df <- df[order(df[, 2], df[, 3], df[, 1], na.last = NA), ]
        
        ### Determine the ranked hospital from each state
        sdf <- split(df, df$State)
        
        ranks <- lapply(sdf, function(x) {
                if (num == "best") {
                        n <- 1
                } else if (num == "worst") {
                        n <- nrow(x)
                } else {
                        n <- num
                }
                
                x$Hospital.Name[n]
        })
        
        
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        
        do.call(rbind, ranks)
}