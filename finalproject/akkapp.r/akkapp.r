library(shiny)
library(tidyverse)

# load data
diet <- read_csv((here("finalproject", "data", "dietdata.csv"))) %>% 
  clean_names()%>% 
  mutate(idnumber = as.numeric(str_replace_all(personal_id, "[^[:digit:]]", ""))) %>% 
  left_join(qall) %>% 
  pivot_longer(cols = am0:am4, names_to = "phylo", values_to = "am_number",
               values_drop_na = TRUE) %>% 
  select(idnumber, sex, age, 
         fruit_total, grains_total, vegetable_total, dairy_total,
         carbpercent = percent_kcal_from_carbohydrate,
         fatpercent = percent_kcal_from_fat,
         protpercent = percent_kcal_from_protein,
         am_number)

# shinyapp

ui<- fluidPage(
  titlePanel("Akkermansia by strain and diet"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Plot Nutritional Values of Akkermansia"),
               
               checkboxGroupInput("var", 
                                         label = "Check desired group", 
                                         choices = list("Percent Fat" = "fatpercent", 
                                                        "Percent Carbs" = "carbpercent", 
                                                        "Percent Protein" = "protpercent")) # base selection
    ),


  mainPanel(plotOutput("jitterplot")) # makes a jitterplot
    )
  )


server<- function(input,output){
  
  
  output$jitterplot <- renderPlot({
    
    ydata <- switch(input$var,
                   "Percent Fat" = diet$fatpercent,
                   "Percent Carbs" = diet$carbpercent,
                   "Percent Protein" = diet$protpercent)
   # color <- switch(input$var,
   #                 "Percent Fat" = "steelblue",
   #                 "Percent Carbs" = "violet",
   #                 "Percent Protein" = "darkorange")

    ggplot(diet, mapping = aes(x = diet$am_number, y = diet$var))+
      geom_jitter(diet, mapping = aes(x = am_number, y = ydata))+
      labs(title = input$var)
  })
  
} # r code goes in here

shinyApp(ui=ui, server=server)
