pollutantmean <- function(directory, pollutant, id = 1:332) {
 
        file_list <- list.files(path = directory, pattern = ".csv") ## Index for files in the directory
        df <- data.frame()      ## Blank data frame to load data
        
        for(i in id) {          ## Combined data frame from the indexed of the id files
                data <- read.csv(paste0(directory, "/", file_list[i]))
                df <- rbind(df, data)
        }

        mean(df[, pollutant], na.rm = TRUE)     ## Calculate the mean value of the given pollutant 
}


                
