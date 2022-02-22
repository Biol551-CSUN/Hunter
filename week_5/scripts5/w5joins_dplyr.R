########################
### Practive script for Tuesday class
## author Jessica Hunter
## created February 22, 2022

## this script will 

################################33
#---------- Libraries-------

library(tidyverse)
library(here)

###################################
#------ Load data------
## load in environmental data from each site
EnviroData<-read_csv(here("week_5", "data5", "site.characteristics.data.csv"))
# load in thermal performance data
TPCData<-read_csv(here("week_5", "data5", "Topt_data.csv"))


####################################
# ----- functions------


EnviroData_wide<- EnviroData %>% 
  pivot_wider(names_from = parameter.measured,
              values_from = values) %>% 
  arrange(site.letter)
view(EnviroData_wide)


# left join add the right to the left and excludes anything not in left
FullData_left<-left_join(TPCData,EnviroData_wide) %>% 
  relocate(where(is.numeric), .after = where(is.character)) %>% 
  arrange(site.letter) 
### where is the data
head(FullData_left)


FullData_leftlong<-FullData_left %>% 
  pivot_longer(cols = E:Topt,
               names_to = "variables",
               values_to = "values") %>% 
  group_by(site.letter) %>% 
  summarise(meandata = mean(values, na.rm = TRUE),
            vardata = var(values, na.rm = TRUE))
view(FullData_leftlong)

#leavewidesummarize<-FullData_left %>% 
#  group_by(site.letter) %>% 
 # summarize_if(is.numeric(),
               
# Relocate deals with columns


tibble1<-tibble(Site.ID = c("A", "B", "C", "D"),
                Temperature = c(14.1, 16.7, 15.3, 12.8))
tibble1

tibble2<-tibble(Site.ID = c("A", "B", "D", "E"),
                ph = c(7.3, 7.8, 8.1, 7.9))
tibble2

left_join(tibble1, tibble2)
right_join(tibble1, tibble2)
inner_join(tibble1, tibble2) # only retains the ones in both
full_join(tibble1, tibble2) # reatains everything and has NA's for missing
semi_join(tibble1, tibble2) # only retain complete in both but also only left side
anti_join(tibble1, tibble2) # keeps whatis in x thats completely missing in y (left side)



