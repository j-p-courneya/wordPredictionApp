library(shiny)
library(dplyr)
library(quanteda)
library(data.table)

shinyServer(
  function(input,output) {
    
    #Display text user provided
    txtReturn <- eventReactive(input$button1, {
      input$impText
    })
    output$inputText <- renderText({txtReturn()})
    
    #Get a table of predicted words and score
    predWords <- eventReactive(input$button1, {
    head(stupidBackoffPredFunction(input$impText), input$impWords)
    })
    output$predTable <- renderTable({predWords()})
  }
)