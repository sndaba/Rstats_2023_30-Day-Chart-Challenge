#install packages
install.packages('maps')
install.packages('tidyverse')
install.packages('rvest')
install.packages('magrittr')
install.packages('ggmap')
install.packages('stringr')

#libraries
library(tidyverse)
library(rvest)
library(magrittr)
library(ggmap)
library(stringr)

#get data on Percentage of children (2-14) who experience any violent disciple (UNICEF Global Databses (2016))
child <- read_csv("https://raw.githubusercontent.com/sndaba/Rstats_2023_30-Day-Chart-Challenge/main/Day6OWID/percentage-of-children-214-who-experience-violent-discipline-at-home.csv.csv")

#change variable name
child <- child %>% 
  rename("Percent" = "Perecnt")

#get world map
map.world <- map_data("world")

# INSPECT
as.factor(child$Entity) %>%
  levels()

# LEFT JOIN
joined <- left_join(map.world, child, by = c('region' = 'Entity'))

#indicate whether or not we want to fill in" a particular country on the map
joined <- joined %>%
  mutate(fill_percent = ifelse(is.na(Percent),F,T))

#map
ggplot() +
  geom_polygon(data = joined,
               aes(x = long, 
                   y = lat, 
                   group = group, 
                   fill = fill_percent)) +
  scale_fill_manual(values = c("#CCCCCC","#e60000")) +
  
  labs(title = 'Countries where children experience violent discipline at home',
       subtitle = "source: https://data.unicef.org/topic/child-protection/violence/violent-discipline/") +
  
  theme(text = element_text(family = "Gill Sans", color = "#FFFFFF")
        ,panel.background = element_rect(fill = "#444444")
        ,plot.background = element_rect(fill = "#444444")
        ,panel.grid = element_blank()
        ,plot.title = element_text(size = 9)
        ,plot.subtitle = element_text(size = 6)
        ,axis.text = element_blank()
        ,axis.title = element_blank()
        ,axis.ticks = element_blank()
        ,legend.position = "none"
  )

ggsave("child.png", width = 6,   height = 4)
