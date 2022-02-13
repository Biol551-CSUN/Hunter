#######################################
## week 3b group script##
### if not installed install package
### install.packages("palmerpenguins")  ###
### This session we are learning how to plot

## Author Group1
########################################

library(tidyverse)
library(palmerpenguins)
library(here)


ggplot(penguins, aes(x=sex, y=body_mass_g, fill=sex)) + 
  geom_boxplot()+
  facet_wrap(~species, scale="free")+
  scale_x_discrete(labels = c("Male","Female","Non binary"))+
  labs(title = "Body Mass by Species and Sex",
    y ="Body Mass (g)",
        x = "Sex")+
  theme_bw()+
  theme(legend.position="none",
        axis.title = element_text(size = 15,
                                        color = "black"),
              panel.background = element_rect(fill = "linen"),
        title = element_text(size = 20))



##add comments                                                                    