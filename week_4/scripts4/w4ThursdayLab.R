###############################################
#### Week 4 Thursday Script for Lab
### Author Group 1 and Jessica Hunter
### Created February 17, 2022
### updated February 22, 2022

# This script will filter the data and make a plot and output it
###############################################


##### Libraries ######]
library(tidyverse)
library(here)


######### Load Data #######

chemdata2<-read_csv(here("week_4", "data4", "chemicaldata_maunalua.csv"))
view(chemdata2)



#### Functions ####

## ------- This function creates a clean script without any NA's
## it filters out the Night data, it pivots my data longer, 
## calculates the average water composition by season and Site location 
## and creates a csv file of my new data summary
chemdata2clean<-chemdata2 %>% # creating new file of clean data
  filter(complete.cases(.)) %>%  # removes the columns that are incomplete
  separate(col = Tide_time, # this is the colume I want to seperate
           into = c("tide", "time"), # these are titles for the new data columns
           sep = "_", # separates using an _ underscore symbol
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
  write_csv(here("week_4" , "output4", "Summary_composition_at_night.csv"))



#################### Function 2 ------------
### this function creates a violin plot of the water composition values based on high and low tide



chemdatalong %>% 
  ggplot(aes(x= variables,
             y = values, 
             fill=tide))+
  geom_violin()+ # vilin plot
  facet_wrap(~variables, # wraps by columns
             scales = "free")+ # releases the scales to be different for each mini plot

labs(y = "Values",
     x= "Water Composition Variables",
     tide = "Tide",
     title = "The Composition of Water during High Tide and Low Tide", # created title to plot
     caption = "Source: Silbinger et al. 2020 Proceedings of the Royal Society:B")+ # add a caption ;source
  theme(plot.title = element_text(size = 20), # changes the size of the title
        panel.background = element_rect(fill="linen"), # changes the background on the plot
        axis.title = element_text(size = 15))  # change the size of the axis titles
        # legend.text = element_text("Tide"))
ggsave(here("week_4", "output4", "Thursday_lab_homework.png"), ## saving to my folder output
       width = 7,
       height = 5) # in inches

