best <-
        function(state, outcome) {
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
                
                ## Check that state and outcome are valid
                
                if (state %in% data$State) {
                        
                } else {
                        stop("invalid state")
                }
                
                if (outcome %in% names(oc)) {
                        
                } else {
                        stop("invalid outcome")
                }
                
                ## Return hospital name in that state with lowest 30-day death
                ## rate
                
                ### Subset the state and outcome
                
                df <-
                        data[data$State == state, c(2, 7, oc[outcome])]
                
                ### Print the best hospital
                
                print(df$Hospital.Name[which.min(df[, 3])])
                
        }



