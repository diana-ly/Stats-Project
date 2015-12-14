# Cleaning/joining player_stats and salary to output clean data for analysis

# The purpose of this file of code is to get the data that we need to analysis
# our research question: Do the skills of player relate to their salary? The 
# final data include the player stats, player positions, and salary 
# respectively. 

library(dplyr)

source("./code/functions.r")

player_stats <- read.csv("./data/player_stats.csv")
salaries <- read.csv("./data/salaries.csv")

stats_salary <- left_join(player_stats, salaries, by = 'Player')
stats_salary <- subset(stats_salary, select = -c(Team.y, X.y, X.x))

# Omit players without salary data
stats_salary_pos <- stats_salary[-which(is.na(stats_salary$Salary)), ]

# For players traded during the season, only use one stat of that player.
# See documentation of functions.r to understand unique_data function

keep <- unique_data(stats_salary_pos, "Player")

# We used the keep logical vector to subset the data frame. 
stats_salary_pos <- stats_salary_pos[keep, ]

write.csv(stats_salary_pos, "data/roster_salary_stats.csv")
