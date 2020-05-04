complete <- function(directory, id = 1:332) {
        file_list <- list.files(path = directory, pattern = ".csv")
        df <- data.frame(id = NA, nobs = NA)[numeric(0), ]
        n = 1
        
        for (i in id) {
                data <- read.csv(paste0(directory, "/", file_list[i]))
                df[n, "id"] <- data[1, "ID"]
                df[n, "nobs"] <- sum(complete.cases(data))
                n <- n + 1
        }
        
        df
        
}
