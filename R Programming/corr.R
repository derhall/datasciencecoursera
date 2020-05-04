corr <- function(directory, threshold = 0) {
        file_list <- list.files(path = directory, pattern = ".csv")
        
        n = 1
        
        r <- vector(mode = "numeric")
        
        for (i in 1:length(file_list)) {
                data <- read.csv(paste0(directory, "/", file_list[i]))
                
                if (sum(complete.cases(data)) > threshold) {
                        r[n] <- cor(data$nitrate, data$sulfate, 
                                    use = "complete.obs")
                        
                        n <- n + 1
                }
        }
        
        r
}
