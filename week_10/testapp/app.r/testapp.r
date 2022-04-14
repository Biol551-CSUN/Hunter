library(shiny)
library(tidyverse)

ui<- fluidPage(sliderInput(inputId = "num", # ID name for the input
                           label = "Choose a number", # Label above the input
                           value = 25, min = 1, max = 100 # values for the slider
), # comma important
textInput(inputId = "title", # new Id is title
          label = "Write a title",
          value = "Histogram of Random Normal Values"), # starting title

plotOutput("hist"), # makes a histogram called plot,
verbatimTextOutput("stats")
)

server<- function(input,output){
  
  data<-reactive({
      tibble(x = rnorm(input$num)) # 100 random normal points
    })
  
  output$hist <- renderPlot({
    
    # data<-tibble(x= rnorm(input$num))# random number up to 100
    # 
    
      
    ggplot(data(), aes(x=x))+
      geom_histogram()+
      labs(title = input$title)
  })
  
  output$stats <- renderPrint({
    summary(data())
  })
} # r code goes in here

shinyApp(ui=ui, server=server)

