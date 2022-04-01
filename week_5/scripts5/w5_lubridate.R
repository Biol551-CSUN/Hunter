
# this is my study notesand practice taken during class









library(tidyverse)
library(lubridate)
library(here)





now()
now(tzone = "EST")
today()
am(now())
leap_year(now())

# lubridate
# y - tear
# m - month
# d - day
# h
# m 
#s
### date has to be a character
# use _csv and not .cvs

ymd("2021-02-24") # or can type in the column 

mdy("March 25, 1984") # slash or write out
dmy()

ymd_hms("2021-02-24 10:22:20 PM")
## [1] "2021-02-24 22:22:20 UTC"

mdy_hms("02/24/2021 22:22:20")
## [1] "2021-02-24 22:22:20 UTC"

mdy_hm("February 24 2021 10:22 PM")
## [1] "2021-02-24 22:22:00 UTC"

# use c for vestor

# make a character string
datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")
# convert to datetimes
datetimes <- mdy_hms(datetimes)


month(datetimes)

month(datetimes, label = TRUE)

month(datetimes, label = TRUE, abbr = FALSE) #Spell it out
day(datetimes) # extract day
wday(datetimes, label = TRUE) # extract day of week

# make a character string
datetimes<-c("02/24/2021 22:22:20", 
             "02/25/2021 11:21:10", 
             "02/26/2021 8:01:52") 
# convert to datetimes
datetimes <- mdy_hms(datetimes) 
month(datetimes, label = TRUE, abbr = FALSE) #Spell it out 
day(datetimes) # extract day 
wday(datetimes, label = TRUE) # extract day of week

hour(datetimes)
minute(datetimes)
second(datetimes)


datetimes + hours(4) # this adds 4 hours
# s on end means to add information

# hour() extracts the hour component from a time and hours() is used to add 
# hours to a datetime

datetimes + days(2) # this adds 2 days
 
# day() extracts the hour component from a time and days() is used to add hours to a datetime

# You can do the same with minutes(), seconds(), months(), years(), etc.

round_date(datetimes, "minute") # round to nearest minute

## [1] "2021-02-24 22:22:00 UTC" "2021-02-25 11:21:00 UTC"
## [3] "2021-02-26 08:02:00 UTC"

round_date(datetimes, "5 mins") # round to nearest 5 minute

## [1] "2021-02-24 22:20:00 UTC" "2021-02-25 11:20:00 UTC"
## [3] "2021-02-26 08:00:00 UTC"

# You can do this with any set of times

# Read in the conductivity data (CondData.csv) and convert the date column to a 
# datetime. Use the %>% to keep everything clean.

condata <- read_csv(here("week_5","data5", "CondData.csv"))
# head(condata)
# error i wrote in but didn't save
# always has to assign to if change or
# or use pipe

condata <- condata %>% 
  mutate(dateandtime = mdy_hms(depth))
view(condata)

condata <- read_csv(here("week_5","data5", "CondData.csv")) %>% # read in the data
  mutate(dateandtime = mdy_hms(depth), # convert to datetime
         dateandtime = round_date(dateandtime, "10 seconds")) %>% 
  drop_na() %>%  # dropping missing data to no more na's
  select(!depth)  # to remove the depth,
view(condata)  
# you have to mutate no matter what because you are changing something

# Warning message:
#  Problem with `mutate()` column `dateandtime`.
# ℹ `dateandtime = mdy_hms(depth)`.
# ℹ  1 failed to parse. 
  
depdata <- read_csv(here("week_5", "data5", "DepthData.csv")) %>% 
  mutate(dateandtime = ymd_hms(date)) # have to list in the format it is in for program to find
view(depdata)
spec(depdata)

spec(condata)


dep_con_data <- inner_join(depdata,condata) %>% 
  select(!date) %>% 
  # separate(col = dateandtime,
  #          into = c("date","time"),
  #          sep=" ",
  #          remove = FALSE) %>% # to keep the original column
  mutate(timebyminute = round_date(dateandtime, "1 minute")) %>%
  group_by(timebyminute) %>% # grouping variable
  summarise_at(vars(c("dateandtime","TempInSitu","Depth","SalinityInSitu_1pCal")), list(mean = mean))


  # summarize(MeanDate =  mean(dateandtime),
  #           meanDepth = mean(Depth), 
  #           meantemp = mean(TempInSitu), 
  #           meansalinity = mean(SalinityInSitu_1pCal))
# summarize and name one by one
view(dep_con_data)

dep_con_data %>% 
  ggplot(mapping = aes(x= dateandtime_mean,
             y = SalinityInSitu_1pCal_mean)) +
  geom_smooth()
 # geom_point(alpha = 0.3)



