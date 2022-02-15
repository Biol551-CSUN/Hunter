#######################################
## week 3b group script##
### if not installed install package
### install.packages("palmerpenguins")  ###
### This session we are learning how to plot using ggplot

## Authors Group1
#created February 10, 2022
#final edit February 15, 2022

########################################

library(tidyverse)
library(palmerpenguins)
library(here)


ggplot(penguins, aes(x=sex, y=body_mass_g, fill=sex)) + 
  geom_boxplot()+ #a boxplot script
  facet_wrap(~species, scale="free")+
  scale_x_discrete(labels = c("Male","Female","Non binary"))+  ###if you dont want to use numbers
  labs(title = "Body Mass by Species and Sex",  ##labels
    y ="Body Mass (g)",
        x = "Sex")+
  theme_bw()+
  theme(legend.position="none", #this removes the legend
        axis.title = element_text(size = 15,
                                        color = "black"),
              panel.background = element_rect(fill = "linen"),
        title = element_text(size = 20))


ggsave(here("week_3", "output", "grouphomework4.png"), #file path and name
       width = 7, height = 5)
                                                               