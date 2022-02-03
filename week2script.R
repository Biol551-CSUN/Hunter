### This is my first script
### created by: Jessica Hunter
### created on: 2022.02.03
######################################

###### load libraries ######
library(tidyverse)
library(here)


#### read in data ####
## read_csv and read reads the file
WeightData<-read_csv(here("week_2", "data", "weightdata.csv"))



### data analysis
#head(WeightData) looks at top 6 lines
###tail(WeightData)

head(WeightData)
tail(WeightData)
view(WeightData)  #view the dataset

# created with an unbreakable file path