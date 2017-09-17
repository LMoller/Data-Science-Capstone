library(magrittr)
library(stringr)
library(RSQLite)
library(tm)

predictWord <- function(orig, db) {
        # "Stupid Backoff" - Check if n-gram exists. If the n-gram does not exist, multiply by alpha and back off to lower gram model. In this case, alpha is not needed, simple back off to a lower gram model.
        
        max = 3  # the maximum n-gram used was 4, so 4 - 1
        
        # Clean the original sentence
        cleaned <- tolower(orig) %>%
                removePunctuation %>%
                removeNumbers %>%
                stripWhitespace %>%
                str_trim %>%
                strsplit(split=" ") %>%
                unlist
        
        for (i in min(length(cleaned), max):1) {
                gram <- paste(tail(cleaned, i), collapse=" ")
                sql <- paste("SELECT word, freq FROM nGram WHERE ", 
                             " prior=='", paste(gram), "'",
                             " AND n==", i + 1, " LIMIT 5", sep="")
                res <- dbSendQuery(conn=db, sql)
                predicted <- dbFetch(res, n=-1)
                names(predicted) <- c("Word Prediction", "Score (Adjusted Freq)")
                print(predicted)
                
                if (nrow(predicted) > 0) return(predicted)
        }
        
        return("I do not have a prediction.")
}