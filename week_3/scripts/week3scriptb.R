#######################################
## week 3b script##
### if not installed install package
### install.packages("palmerpenguins")  ###
### This session we are learning how to plot using ggplot

## Author Jessica

## Created date Feb 10, 2022
##last updtated Feb 15, 2022
########################################


#### "libraries"
library(tidyverse)
library(palmerpenguins)
library(beyonce)
library(here)
#devtools::install_github("dill/beyonce") if not already installed

plot1<-ggplot(data=penguins, mapping = aes(x = bill_depth_mm, ### names plot
                                    y = bill_length_mm,
                                    group = species,
                                    color = species))+
  geom_point()+  ##creates point graph
  geom_smooth(method = "lm") +
  labs(x = "Bill Depth (mm)",
       y = "Bill Length (mm)"
       ) +
  #scale_color_viridis_d()+ ## color blind safe colors
scale_color_manual(values = beyonce_palette(10))+
## scale has 3 parts color, shape
##scale_color_continuous()
scale_x_continuous(breaks = c(14,17,21), #limits sets the limits
  labels = c("low", "medium", "high"))+
  scale_y_continuous(limits = c(0,50))+ 
  theme_bw()+
  theme(axis.title = element_text(size = 20,
                                  color = "red"),
                                  panel.background = element_rect(fill = "purple"),
                                  legend.background = element_rect(fill = "orange"))
##make sure you put c in front means contatinous
##breaks puts the breaks in the axis
plot1
#scale_color_manual(values = c("orange", "purple", "cyan"))


## install.packages('devtools') to install the developmental packages that didn't go through peer review

## beyonce color pallets https://github.com/dill/beyonce

##library(beyonce)
 #coord_fixed()
#coord_polar("x")

ggsave(here("week_3","output","penguin.png"),
       width = 7, height = 5) # in inches

#ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm, color = "red"))+geom_point() 
