### this is my notes section for myself

### here package allows us to nagigate our projects easily and share
# Unbreakable file path is transferable for someone elses computer because 
#when they download it will be saved in a different
# here::here("folder name", "name of file") - to the left is function name and 
# right is package name
# use here( "outer folder name", "inner folder name", "name of file") if it is both


#tidyverse is for data manipulation and visualization - contains ggplot

################## Transparent Script #######
## 1. Intro - name date last edit purpose

## 2. Libraries
 # add all libraries
# library(tidyverse)
# library(here)

## 3. function

## 4. Load data

## 5. Analysis

## comment comment comment


#intro-------------
# purpose
# Author 
# date created 

# libraries ------------
#library(tidyverse)

# load data ------
# Filename<-readcsv(........)
# complete.cases(.) to remove na's

# functions ----------
# function to create a prediction map

# analysis -------
# calculate blahhh





###### Daily ######
#git pull - downloads repository 
#git add testscript.r - i want to add new files to repo, stages
## git add week_3/ will add the whole folder
##git commit -a -m "I am adding testscrip.R" - saves changes
###### -a means commits to every change; all
###### -m means I am adding a message
#git push - downloads to internet
## commit often because reverting will go back to last commit
# to revert to last commit go to blue wheel


##### ggplot ######
#ggsave(here("week_3", "output", "grouphomework4.png"),
#       width = 7, height = 5)
#c means concatonate which means to bring together the vector




##### random ####
### use gg genes to create genes


##### dyplr ###


#Pick observations by their values (filter()).
##### & is “and”, | is “or”, and ! is “not”. 

#Reorder the rows (arrange()).
#Pick variables by their names (select()).
#Create new variables with functions of existing variables (mutate()).
#Collapse many values down to a single summary (summarise()). summarizes

#groupby
#summarise
#filter for row and select is for column

library(devtools) # load the development tools library
devtools::install_github("jhollist/dadjoke")

library(dadjoke)
dadjoke()



#library(nycflights13)

#  if associated with data has to go in astethics if not then can go out, 
#

#### read in data ####
## read_csv and read reads the file - use underscore instead of .
#because brings in all characters as characters
# WeightData<-read_csv(here("week_2", "data", "weightdata.csv"))


# write_csv() to create files


# Create folders in terminal
# $ cd week_4 ### to go to that directory cd means current directory
# to creATE A folder 
# $ mkdir foldername - to make new folder
# cd ../ -  to go back up one folder  
# install.packages("packagename")  - to install packages 


### how to look at data
# head(data) - look at top 6
# tail(dtata) - looks at bottom 6 lines
# view(data)


#animals that talk to you
#install.packages("cowsay")
library(cowsay)
# I want a shark to say hello
say("hello", by = "shark")
say("I want pets", by = "cat")
say("hello", by = "pig")
#say("hi", by = "dog") # no dog
say(by ="random")
#“cow”, “chicken”, “chuck”, “clippy”, “poop”, “bigcat”, “ant”, “pumpkin”, 
#“ghost”, “spider”, “rabbit”, “pig”, “snowman”, “frog”, “hypnotoad”, “shortcat”,
#“longcat”, “fish”, “signbunny”, “facecat”, “behindcat”, “stretchycat”, 
#“anxiouscat”, “longtailcat”, “cat”, “trilobite”, “shark”, “buffalo”, 
#“grumpycat”, “smallcat”, “yoda”, “mushroom”, “endlesshorse”, “bat”, “bat2”, 
#“turkey”, “monkey”, “daemon”, “egret”, “duckling”, “duck”, “owl”, “squirrel”, 
#“squirrel2”, “rms”, “random”



# catterplot uses catss in your graphs
#install.packages("beepr")
library(beepr)
beep(5)

# devtools::install_github("sctyner/memer")
library(memer)

meme_list()
meme_get("FryNotSure")
meme_get("NoneOfMyBusiness") %>% 
  meme_text_top("I don't always like coding", size = 28) %>% 
  meme_text_bottom("But when I do\nIt's always today's totally awesome R package", size = 18)
