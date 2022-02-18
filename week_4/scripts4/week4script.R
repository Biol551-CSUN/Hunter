################################
### THis is week 4a script
### this script will plot penguin data

###Author Jessica Hunter

## Date created Feb 15, 2022

###notes

# <,
#>,
# ==, 
# <=, >=, 
#!= not equal to
# &

### libraries

library(tidyverse)
library(palmerpenguins)
library(here)

#### functions


glimpse(penguins)
head(penguins)


filter(.data = penguins, 
       sex == "female") ## two equal signs means is this exactly equal to = true false
filter(.data = penguins, 
       year == "2008")
filter(.data = penguins, 
       body_mass_g > 5000)
filter(.data = penguins,
       sex == "female" & body_mass_g > 5000)
filter(.data = penguins,
       year == "2008" | year == "2009")
filter(.data = penguins,
       island != "Dream")
filter(.data = penguins,
       species %in% c("Adelie","Gentoo"))

filter(.data = penguins,
       island %in% c("Dream","Biscoe"))

# mutate adds new column


#create new dataset

data2<-mutate(.data = penguins, # creates new column in kg
              body_mass_kg = body_mass_g/1000,
              bill_length_depth = bill_length_mm/bill_depth_mm)
# convert mass to kg 
# calculate the ratio of bill length to depth)
view(data2)

# mutate_if(), 
# mutate_at(), 
# mutate_all()
#case_when if more than 2 outcomes
#ifelse for 2 outcomes
data2<-mutate(.data = penguins, # creates new column in kg
              after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))
data2<-mutate(.data = penguins, #mutate creates new column
              flipperlength_plus_mass = flipper_length_mm+body_mass_g,
              bodymass_bigsmall = ifelse(body_mass_g>4000, "big", "small"))
view(data2)              


### the pipe   %>%  means and then

#hotkey ctrl+ shift+ m   %>% 
# verb1() %>% # do verb 1 and then
  
  #verb2() # do verb 2

data3<-penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) #calculate log biomass
view(data3)

#filter for row and 
# select is for column

penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(species, island, sex, log_mass)  # select column 

penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(Species = species, island, sex, log_mass) # rename column to a capital Species or use rename function

penguins %>% 
  drop_na(sex) %>% 
  group_by(island, sex, species) %>% # gets the summarised variable by the group
  summarise(mean_flipper = mean(flipper_length_mm,
                                na.rm = TRUE), # skip na entries
            min_flipper = min(flipper_length_mm, 
                              na.rm=TRUE)) # skips the NA entries
### remove missing data
# drop_na(column1, column2, ...) tidyverse function

penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot()



