# Cleaning/Joining roster and player_stats to get salary_stats_pos

# The purpose of this file of code is to get the data that we need to analysis our
# research question: Do the skills of player relate to their salary? The final data
# include the player stats, player positions, and salary respectively. 

library(dplyr)

source("code/cleaning_roster_and_stats.R")
source("code/cleaning_salaries.R")

# Reading the necessary datasets 
roster <- read.csv('data/roster.csv', stringsAsFactors = F)
player_stats <- read.csv('data/player_stats.csv', stringsAsFactors = F)
salary <- read.csv('data/salaries.csv', stringsAsFactors = F)

# The purpose for this join is for player_stats to have the salary column for each
# player. The subset is for to remove the repeated columns. 
stats_salary <- left_join(player_stats, salary, by = 'Player')
stats_salary <- subset(stats_salary, select = -c(Team.y, X.y, X.x, Position))

# The rawdata that we obtained from espn.com did not have some players' salary 
# for the 2014-2015 season. Thus we had to obmit the players without salary from 
# the dataframe, since they do not contribute to the analysis. 
stats_salary <- stats_salary[-which(is.na(stats_salary$Salary)), ]

# Since stats_salary does not include the position that each player plays, the
# position data frame is to add the position to stats_salary. We just subset the
# Player and the Pos column from roster. 
position <- subset(roster[which(roster$Player %in% stats_salary$Player), ],
                   select = c(Player, Pos))
# Then we joined stats_salary and position in order to add the position column.
stats_salary_pos <- unique(left_join(stats_salary, position, by = "Player"))


# Since some players get traded several time during the season, for example, A.J. 
# Price was one the Cavaliers, Pacers, and Suns, we decided to only use one stat 
# for each player. We used the logical vector to subset the data frame. First we
# made two empty vector, character vector and logical vector. The for loop goes 
# through the Players in stats_salary_pos and append TRUE if the player is not in
# the unique_players vecotr and append the player character string into 
# unique_players; append FALSE if the player character string is already in 
# unique_players. 
unique_players <- character()
keep <- logical()

for(i in 1:nrow(stats_salary_pos)){
  if(stats_salary_pos$Player[i] %in% unique_players){
    keep[i] <- F
  }
  else {
    keep[i] <- Tunique_players <- c(unique_players, stats_salary_pos$Player[i])
  }
}

# We used the keep logical vector to subset the data frame. 
stats_salary_pos <- stats_salary_pos[keep, ]

write.csv(stats_salary_pos, "data/roster_salary_stats.csv")
