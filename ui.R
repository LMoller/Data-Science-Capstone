library(shiny)

shinyUI(fluidPage(
        titlePanel("Word Predictor - Coursera Data Science Capstone by E. Moller"),
        sidebarLayout(
          sidebarPanel(
            textInput("text", label = h3("Input"), value = "this is my"),
            helpText("Type in a sentence above, hit enter on your keyboard or click the button below. The results will display to the right."),
            submitButton("Predict")
            ),
          
          mainPanel(
          br(),
          h2(textOutput("cleaned"), align="center"),
          h1(textOutput("predicted"), align="center", style="color:blue"),
          h3("Top 5 Predictions:"),
          div(tableOutput("options"), align="center")
          )
        )
        ))