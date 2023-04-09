install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("forcats")
install.packages("hrbrthemes")
install.packages("viridisLite")
install.packages("ggridges")
install.packages("png")
install.packages("ggExtra")

library(ggExtra)
library(png)
library("patchwork")
library(ggridges)
library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(hrbrthemes)
library(viridis)

race <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-09/race_wealth.csv")

race <- race %>% 
  dplyr::filter(year > 2000)

#any missing values
is.na(race)
race[is.na(race)] <- 0

#plot
wealth <-  ggplot(race, mapping=aes(y=race, x=wealth_family, fill=race)) +
  geom_density_ridges(alpha=0.6, stat="binline", bins=20) 

wealth + labs(x="Family welath in $",
              y="",
              title = "Race_Wealth",
              subtitle = "Family wealth by race from 2001 to 2016",
              caption = "source:TidyTuesday-2021") +
  theme(
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
    plot.margin = margin(0.2, 0.2, 0.2, 0.2, "cm"),
    plot.title = element_text(family="Montserrat",  
                              color = "black", 
                              face = "bold", 
                              lineheight = 0.3),
    plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "black", hjust = 0.8),
    panel.background = element_rect(fill = "yellow"),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank()
  )

  

   
