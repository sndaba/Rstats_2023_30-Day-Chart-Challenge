#install packages
install.packages('tidyverse')
install.package('ggplot2')
install.packages('ggimage')

#libraries
devtools::install_github("Mikata-Project/ggthemr")
library("ggthemr")
library(tidyverse)
library(ggimage)
library(ggplot2)

#get data
pres <- read_csv("https://raw.githubusercontent.com/sndaba/2023_30-Day-Chart-Challenge/main/Day4Historical/beer-consumption-per-person.csv")

#data filtering
pres <- pres %>% 
  rename("indicatorBeer" = "Indicator:Alcohol, recorded per capita (15+) consumption (in litres of pure alcohol) - Beverage Types:Beer") %>%
  filter(Entity=="Botswana") %>% filter(Year < '2000')

#ggimage 
img <- "https://freepngimg.com/thumb/beer/9-2-beer-png-2.png"

#plotting
 beer <- ggplot(pres, 
                aes(x=Year, 
                    y=indicatorBeer, 
                    size = 0.01,  
                    image=img))+
   geom_image(size = 0.05) + 
   geom_vline(xintercept = 1966, 
              linetype="dashed", 
              size=0.8) +
   annotate("text", 
            x=1966, 
            y=4, 
            label="Independence: 1966")
 ggthemr("flat", 
         type="inner", 
         layout="scientific", 
         spacing=2)
 beer + labs(title = "Alcohol consumption in Botswana",
             subtitle = "Average annual per capita beer consumption, 
measured in liters of pure alcohol pre and post independence.",
             caption = "source:OurWorldInData/alcohol-consumption") +
   theme(
     plot.margin = margin(0.2, 0.2, 0.2, 0.2, "cm"),
     plot.title = element_text(family="Montserrat",  
                               color = "black", 
                               face = "bold", 
                               lineheight = 0.3),
     plot.subtitle = element_text(color = "black"),
     plot.caption = element_text(color = "black", hjust = 0.8),
     panel.grid.major.y = element_blank(),
     panel.grid.minor.y = element_blank()
   )
 
 


 
