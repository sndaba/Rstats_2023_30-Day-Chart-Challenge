install.packages('readr')
install.packages("ggplot2")  
install.packages('hrbrthemes')
install.packages("dplyr")
install.packages('ggthemes')

library(hrbrthemes)
library(ggthemes)
library(dplyr)
library(ggplot2)
library(readr)

#ani <- read_csv("https://raw.githubusercontent.com/sndaba/2023_30-Day-Chart-Challenge/main/Day3Flora_Fauna/animal-data-1.csv")

ani %>%
 head(10290) %>%
  ggplot( aes(x=movementtype, y=speciesname)) +
  geom_line( color="grey") +
  geom_point(aes( color=movementtype))+
  theme_ipsum() +
theme_wsj()+ scale_colour_wsj("colors6")+
 #ggtitle("Animal adoption by Species from 2009 to 2019") +
  labs(
    colour = "movement Type",
    title = "Adoption movement of species from 2009 to 2019",
    subtitle = "Source: kaggle_animal-shelter-analytics"
  )
