pollutantmean <- function(directory, pollutant, id = 1:332) {
        file_list <- list.files(path = directory, pattern = ".csv")
        df <- data.frame()     
        
        for (i in id) {
               
                data <- read.csv(paste0(directory, "/", file_list[i]))
                df <- rbind(df, data)
        }
        
        mean(df[, pollutant], na.rm = TRUE)     
}
