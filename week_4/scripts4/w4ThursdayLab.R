###############################################
#### Week 4 Thursday Script for Lab
### Author Group 1 and Jessica Hunter
### Created February 17, 2022

# This script will filter the data and make a plot and output it
###############################################


##### Libraries ######]
library(tidyverse)
library(here)


######### Load Data #######

chemdata2<-read_csv(here("week_4", "data4", "chemicaldata_maunalua.csv"))
view(chemdata2)



#### Functions ####

chemdata2clean<-chemdata2 %>% # creating new file of clean data
  filter(complete.cases(.)) %>%  # removes the columns that are incomplete
  separate(col = Tide_time, # this is the colume I want to seperate
           into = c("tide", "time"), # these are titles for the new data columns
           sep = "_",
           remove = FALSE) %>% # true deletes original col and false keeps the original col
  filter(time == "Night") # Only kept night data
### 
view(chemdata2clean)

chemdatalong<-chemdata2clean %>% 
  pivot_longer(cols = Temp_in:TA, ## it selects all the columns in the range
               names_to = "variables",
               values_to = "values")
#### has to be the same types of data to combine
view(chemdatalong)

chemdatalong %>% 
  group_by(variables,Season, Site) %>% 
  summarise(mean_value = mean(values, na.rm = TRUE)) %>% 
  write_csv(here("week_4" , "output4", "Summary_composition_at_night"))



chemdata2clean %>% 
  ggplot(aes(x= Season,
             y = Temp_in, fill=tide))+
           geom_violin()

chemdatalong %>% 
  ggplot(aes(x= variables,
             y = values, fill=tide))+
  geom_violin()+
  facet_wrap(~variables,
             scales = "free")
  
