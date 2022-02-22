##########################################
# ggplot notes

# Author Jessica Hunter
# Created February 22, 2022

# this breaks down notes and tips for ggplot

#################################

### aes means aestetics
### geom_XXXX means geometry

library(palmerpenguins)
library(tidyverse)

#### mapping- size shape alpha color based on values of variable go here
          ## mapping= aes(x=, y =, etc......)
#### setting - geom_XXX() - size shape and alpha doesnt depend on variable value 

ggplot(data=penguins,
       mapping = aes(x=bill_depth_mm, # map bill depth to x axis
                     y = bill_length_mm, # map data to y axis
                     color = species, # to rep a color for ea point
                     shape = island)) +  # to add shape to a variable ### can use the same variable
                    # alpha = ## transparency   
   geom_point(size = 2,  # to represent observations w/ a point ## size changes all sizes in graph
             alpha = 0.5) + ## changes all transparencies in graph not based on values
  labs(title = "Bill depth and length", # labs to add labels and title to add title
       subtitle = "Dimensions for species etc.",
       x= "Bill depth (mm)", # label the x axis
       y = " Bill length (mm)", # label y axis
       color = "Legend title for color",
       caption = " Put source of data here")+ ## to add a caption
  scale_colour_viridis_d()


### faceting shows smaller plots of different subsets of data
### facet grid
ggplot(penguins,
       aes(x=bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_grid(sex~species)

#### facet wrap
ggplot(penguins,
       aes(x=bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_wrap(~species)

# facet wrap with specified col
ggplot(penguins,
       aes(x=bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_wrap(~species,
             ncol=2)
### facet and color no legend in mapping

ggplot(data=penguins,
       mapping = aes(x=bill_depth_mm, # map bill depth to x axis
                     y = bill_length_mm, # map data to y axis
                     color = species, # to rep a color for ea point
                     shape = island)) +  # to add shape to a variable ### can use the same variable
  # alpha = ## transparency   
  geom_point(size = 2,  # to represent observations w/ a point ## size changes all sizes in graph
             alpha = 0.5) + ## changes all transparencies in graph not based on values
  scale_color_viridis_d()+
  facet_grid(species~sex)+
  guides(color=FALSE, ## to remove legends
         shape=FALSE)
