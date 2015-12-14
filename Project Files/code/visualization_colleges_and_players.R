# This file will output 
# 1. Barchart of Top Ten Institutions producing the most NBA players
# 2. A Map indicating where the institutions are 

library(ggplot2)
library(dplyr)

source("./code/merging_colleges_roster.r")

# This code uses ggplot2 to generate a barplot to compare the top ten colleges 
# that produced the most NBA players. ggplot2 is also used to produce a U.S. 
# map to visualize the locations of the institutions that NBA players attended.


# Graphing a bar chart of the top ten colleges with the most players
# To produce a bar chart, a table of colleges with the amount of players that 
# attended is needed
college_table <- as.data.frame(table(player_colleges$College),
                               stringsAsFactors = F)
colnames(college_table) <- c("College", "Total_Players")
player_colleges <- left_join(player_colleges, college_table, by = "College")
top_ten <- subset(player_colleges, Total_Players >= 10 & Total_Players < 80)
ggplot(top_ten, aes(College, fill = College)) + 
  geom_bar() +
  coord_flip() +
  labs(y = "Number of players") +
  ggtitle("Top Ten Institutions with the Most NBA Players") +
  theme(legend.position="none")

if (require("maps")) {
  data(us.cities)
  ggplot(player_colleges, aes(Longitude, Latitude)) +
    borders("state") +
    geom_point(aes(mapping = Total_Players), colour = "#0000FF") +
    ggtitle("Institutions that 2014-2015 NBA Players Attended") +
    scale_size_area() +
    theme(axis.line=element_blank(),
          axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks=element_blank(),
          axis.title.x=element_blank(),
          axis.title.y=element_blank(), 
          legend.position="none",
          panel.background=element_blank(),
          panel.border=element_blank(),
          panel.grid.major=element_blank(), 
          panel.grid.minor=element_blank(),
          plot.background=element_blank())
}

