################################
### THis is week 4a script for LAB
### this script will calculate penguin data

###Author Group 1

## Date created Feb 15, 2022


library(tidyverse)
library(palmerpenguins)
library(here)

#### this function will calculates the mean and variance of body mass 
# by species, island, and sex without any NAs


penguins %>% 
  drop_na(sex, body_mass_g) %>% 
  group_by(species, island, sex) %>% # gets the summarised variable by the group
  summarise(mean_bodymass = mean(body_mass_g, # finds the mean
                                na.rm = TRUE), # skip na entries
          varience_bodymass = var(body_mass_g, #Variance function
                              na.rm=TRUE)) # skips the NA entries

#### This function filters out (i.e. excludes) male penguins, then calculates 
# the log body mass, then selects only the columns for species, island, sex, and
# log body mass, then use these data to make any plot. 
# Make sure the plot has clean and clear labels and follows best practices. 
# Save the plot in the correct output folder.

penguins %>% 
  drop_na(sex) %>% 
  filter(sex != "male") %>% 
  mutate(logbodymass = log(body_mass_g)) %>% 
  select(species, island, sex, logbodymass) %>% 
  ggplot(mapping = aes(x = species,
                       y = logbodymass,
                       color = island, 
                       shape = island))+
    geom_jitter(width = .2)
# aes()
    #labs()
    
  


ggsave("")

