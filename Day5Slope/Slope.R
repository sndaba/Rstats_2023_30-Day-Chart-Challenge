#install packages
install.packages('tidyverse')
install.packages('ggplot2')
install.packages('gridExtra')

install.packages('png')
install.packages('grid')
library(png)
library(grid)

#libraries
library(ggthemr)
library(tidyverse)
library(ggplot2)
library(GGally)
library(viridis)

#get data
sea <- read_csv("/cloud/project/sealevel.csv")

sea <-sea %>% 
  filter(Year > '2015')

# Plot
 level <- ggparcoord(sea,
           columns = 1:2,
           showPoints = TRUE, 
           title = "Global Seal Level from 2015",
           ) +
   
 geom_text(data=sea %>%
             select(Year) %>%
             mutate(x = 1,
                    y = scale(as.integer(factor(Year)))),
             aes(x = x, y = y, label = Year),
             hjust = 1.1,
             inherit.aes = FALSE) 
 
 level + labs(x= " ",
              y= "variation estimate (mm)",
              title = "Global Sea Level", 
              subtitle= "Sea level rise is caused primarily by two factors
related to global warming:  the added water from melting ice sheets
and glaciers and the expansion of eawater as it warms..",
              caption = "source: https://climate.nasa.gov/")


 
