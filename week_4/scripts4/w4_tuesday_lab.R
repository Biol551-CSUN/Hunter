################################
### THis is week 4a script for LAB Tuesday
### this script will calculate penguin data

###Author Group 1

## Date created Feb 15, 2022
### updated February 22, 2022

############# Libraries #########


library(tidyverse)
library(palmerpenguins)
library(here)


##########################
####### Functions-----------


#### this function will calculates the mean and variance of body mass 
# by species, island, and sex without any NAs


penguins %>% 
  drop_na(sex, body_mass_g) %>% 
  group_by(species, island, sex) %>% # gets the summarised variable by the group
  summarise(mean_bodymass = mean(body_mass_g, # finds the mean
                                na.rm = TRUE), # skip na entries
          varience_bodymass = var(body_mass_g, #Variance function
                              na.rm=TRUE)) # skips the NA entries



#### This function filters out male penguins, 
# then calculates the log body mass, 
# then selects only the columns for species, island, sex, and
# log body mass, then use these data to make any plot. 
# Make sure the plot has clean and clear labels and follows best practices. 
# Save the plot in the correct output folder.

penguins %>% 
  drop_na(sex) %>% # to remove the na's from data
  filter(sex != "male") %>% # this filters out only the males
  mutate(logbodymass = log(body_mass_g)) %>%  # to create new columns of data
  select(species, island, sex, logbodymass) %>% ## this onlt selects for the items listed
  ggplot(mapping = aes(x = species, # this maps the data to x and y axis
                       y = logbodymass,
                       color = island, # this gives the islands color
                       shape = island))+ # this gives silands shape also
    geom_jitter(width = .34, # creates a jitter plot
                size = 2)+ # this determines the size of points
  labs(x= "Species", ### labels the items in the graph
       y = "Logorithimic Body Mass", # labels y
       color = "Island", # labels legend
       shape = "Island", # labels legend
       title = "The Log Body Mass of Penguins by Species", # cretaed title to plot
       caption = "Source: Palmerspenguins package")+ # add a caption ;source
  theme(plot.title = element_text(size = 20), # changes the size of the title
        panel.background = element_rect(fill="linen"), # changes the bachground on the plot
        axis.title = element_text(size = 15))+ # change the size of the axis titles
  scale_color_viridis_d() # so colorblind people can read it
ggsave(here("week_4", "output4", "Tuesday_lab_homework.png"), ## saving to my folder output
       width = 7,
       height = 5) # in inches

  

