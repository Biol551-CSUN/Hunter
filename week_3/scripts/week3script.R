#######################################
## week 3 script##
### if not installed install package
### install.packages("palmerpenguins")  ###
### This session we are learning how to plot

## Author Jessica
########################################

library(tidyverse)
library(palmerpenguins)
glimpse(penguins)

ggplot(data = penguins, ###can use color, shape, size, and alpha (transparency)
  mapping = aes(x = bill_depth_mm, ### x data ###
                y = bill_length_mm, ### y data ###
                size = body_mass_g,
                alpha = flipper_length_mm, ###when I want the transparency to be based off the values
                color = species,  ### I can also make color and shape different things##
                shape = species))+  ### this adds color and shape to same category### 
  geom_point() +  ### if I want all points to look the same I can put color, size and shape here
  labs(title = "Bill Depth and Length",
       subtitle = "dimensions of penguins",
       x = "Bill Depth (mm)",
       y = "Bill Length (mm)",
       color = "Species",
       shape = "Species",
       caption = "Source: Palmer Station LTR / palmerpenguin package")+
       scale_color_viridis_d() +
#facet_grid (species~sex) ### means sex as a function of species+
facet_wrap(~species) ### not a grid and wrapping by species, 
### only columns use right of ~, only rows use left of ~, ncol to specify number of columns
# + guides(color = FALSE) deletes legend

  ### use function labs to create labels ##
  
