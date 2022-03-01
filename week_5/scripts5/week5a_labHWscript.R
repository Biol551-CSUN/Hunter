##################################################
# this is the week 5a script for Biol 551

# Jessica Hunter
# Created February 24, 2022
# updated March 1, 2022

#-- This function joins 2 dat frams together with no NA's
# it will ake the avergaes of date, depth, temperature, and salinity by minute
# then it makes a plot on the salinity by the minute


##############################################
#-------- Libraries---------
library(tidyverse)
library(lubridate)
library(here)

###############################################
#-------Load data--------------

condata <- read_csv(here("week_5","data5", "CondData.csv"))

###############################################
#--------- Functions----------


# this function rounds the conductivity data to the nearest 10 seconds so I can merge with the depth data later

condata <- read_csv(here("week_5","data5", "CondData.csv")) %>% # read in the data
  mutate(dateandtime = mdy_hms(depth), # convert to datetime
         dateandtime = round_date(dateandtime, "10 seconds")) %>% # rounds to the nearest 10 seconds
  drop_na() %>%  # dropping missing data rows to no more na's
  select(!depth)  # to remove the depth


# this function converts the date and time to date and time

depdata <- read_csv(here("week_5", "data5", "DepthData.csv")) %>% 
  mutate(dateandtime = ymd_hms(date)) # have to list in the format it is in for program to find


# this function joins the two data together where there are no NA's and only exact matches
# it also rounds the time to 1 minute and takes the mean of the date, temp, depth, and salinity
dep_con_data <- inner_join(depdata,condata) %>% # joins the two and omits the ones that dont match
  select(!date) %>% # this removes the original date column
  mutate(timebyminute = round_date(dateandtime, "1 minute")) %>% # this rounds by the minute
  group_by(timebyminute) %>% # grouping variable is time
  summarise_at(vars(c("dateandtime","TempInSitu","Depth","SalinityInSitu_1pCal")), list(mean = mean))
view(dep_con_data)

# this function plots the salinity by minute
dep_con_data %>% 
  ggplot(mapping = aes(x= dateandtime_mean, # this maps the x and y
                       y = SalinityInSitu_1pCal_mean)) +
  geom_smooth() + # this is the visual plot
  labs(title = "Salinity over Time",
       subtitle = "Time average by minute for date January 15, 2022",
       x = "Time (min)",
       y = "Salinity (ppm)") +
  theme(plot.title = element_text(size = 20),
        axis.title = element_text(size = 15))

# this function saves the file as a png in my outputs folder
ggsave(here("week_5", "output5", "Salinity_by_time.png"),
       height = 5,
       width = 7)
