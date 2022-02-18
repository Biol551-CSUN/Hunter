#################################
#### Week 4 Thursday Script
### Author Jessica Hunter
### Created February 17, 2022


## this script talks about how to manipulate data
###################################



#separate(
 # data = [data frame you are using],
  #col = [column that you want to separate],
  #into = [name of the new columns],
  #sep = [what are you separating by?]) 

###########################################

### Libraries ############
(library(tidyverse))
library(here)


##### Load Data ##3
ChemDataDictionary<-read_csv(here("week_4", "data4", "chem_data_dictionary.csv"))
ChemData<-read_csv(here("week_4", "data4", "chemicaldata_maunalua.csv"))

View(ChemData)
glimpse(ChemData)

# complete.cases(.) asks if the data is complete
### you might not want to use if you need the other data
### seperate function
#write ?sepereate in console tab to see what you can do

ChemData_clean<-ChemData %>%
  filter(complete.cases(.)) %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide","Time"), # separate it into two columns Tide and time
           sep = "_" , # separate by _
           remove = FALSE) %>% # keep the original tide_time column bc we dont want to get rid of everything in that column
  unite(col = "Site_Zone", # the name of the NEW col #to unite the names
        c(Site,Zone), # the columns to unite
        sep = ".", # lets put a . in the middle
        remove = FALSE) # keep the original

head(ChemData_clean)
View(ChemData_clean)
#### pivot changes between wide and long ##
# Wide to long: pivot_longer()
# Long to wide: pivot_wider()
# If I pivot something to long I can mutate all of my categories at onve

  ChemData_long <-ChemData_clean %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values") # names of the new column with all the values
view(ChemData_long)


ChemData_long %>%
  group_by(Variables, Site) %>% # group by everything we want
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean
            Param_vars = var(Values, na.rm = TRUE)) # get variance


## summarise() has grouped output by 'Variables'. You can override using the .groups argumen
# Summarize at and Summarize all will work without pivoting data


# Think pair share
# Calculate mean, variance, and standard deviation for all variables by site, zone, and tide

#Here is your starter code:
  
  ChemData_long %>%
  group_by(Variables, Site, Tide, Zone) %>% # group by everything we want 
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean 
            Param_vars = var(Values, na.rm = TRUE), # get variance
            Param_stddev = sd(Values, na.rm = TRUE))
### how to make a bunch of differrent plots using facet wrap by variables
  
  ChemData_long %>%
    ggplot(aes(x = Site, y = Values))+
    geom_boxplot()+
    facet_wrap(~Variables)  
##### hard to see because axis identical
# we need to free up axis using free in scales
  ChemData_long %>%
    ggplot(aes(x = Site, y = Values))+ 
    geom_boxplot()+ 
    facet_wrap(~Variables, scales = "free") # frees up all exis x and y
  ## if only want to use free_x and free_y
  
  ChemData_wide<-ChemData_long %>%
    pivot_wider(names_from = Variables, # column with the names for the new columns
                values_from = Values) # column with the values
  
  View(ChemData_wide)  
###### longer uses values to and wider uses values from
  
  ChemData_clean<-ChemData %>%
    filter(complete.cases(.)) %>% #filters out everything that is not a complete row
    separate(col = Tide_time, # choose the tide time col
             into = c("Tide","Time"), # separate it into two columns Tide and time
             sep = "_", # separate by _
             remove = FALSE) %>%
    pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols  
                 names_to = "Variables", # the names of the new cols with all the column names 
                 values_to = "Values") %>% # names of the new column with all the values 
    group_by(Variables, Site, Time) %>%
    summarise(mean_vals = mean(Values, na.rm = TRUE)) %>% 
    pivot_wider(names_from = Variables,
                values_from = mean_vals) %>% 
  write_csv(here("week_4","output4","summary.csv"))  # export as a csv to the right folder
  View(ChemData_clean)

