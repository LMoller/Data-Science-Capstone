library(shiny)
library(RSQLite)
source("predict.R")


shinyServer(function(input, output) {
  db <- dbConnect(SQLite(), dbname="nGramdb.db")
  predictedWords <- reactive({predictWord(input$text, db)})

  output$cleaned <- renderText({input$text})
  output$predicted <- renderText({
    out <- predictedWords()
    if (out[[1]] == "I do not have a prediction.") {
      return(out)
    } else {
      return(unlist(out)[1])
    }})
  output$options <- renderTable({predictedWords()})
})