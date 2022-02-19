### this is my notes section for myself

### here package 


################## Transparent Script #######
## 1. Intro - name date last edir

## 2. Libraries

## 3. function

## 4. Load data

## 5. Analysis

## comment comment comment



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
## read_csv and read reads the file
# WeightData<-read_csv(here("week_2", "data", "weightdata.csv"))


# write_csv() to create files

