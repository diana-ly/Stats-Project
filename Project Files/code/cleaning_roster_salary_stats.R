library(dplyr)

source("code/cleaning_roster_and_stats.R")
source("code/cleaning_salaries.R")

roster <- read.csv('data/roster.csv', stringsAsFactors = F)

player_stats <- read.csv('data/player_stats.csv', stringsAsFactors = F)

salary <- read.csv('data/salaries.csv', stringsAsFactors = F)


stats_salary <- left_join(player_stats, salary, by = 'Player')
stats_salary <- subset(stats_salary, select = -c(Team.y, X.y, X.x, Position))

stats_salary <- stats_salary[-which(is.na(stats_salary$Salary)), ]


position <- subset(roster[which(roster$Player %in% stats_salary$Player), ],
                   select = c(Player, Pos))
stats_salary_pos <- unique(left_join(stats_salary, position, by = "Player"))

unique_players <- character()
keep <- logical()

for(i in 1:nrow(stats_salary_pos)){
  if(stats_salary_pos$Player[i] %in% unique_players){
    keep[i] <- F
  }
  else {
    keep[i] <- T
    unique_players <- c(unique_players, stats_salary_pos$Player[i])
  }
}

stats_salary_pos <- stats_salary_pos[keep, ]

write.csv(stats_salary_pos, "data/roster_salary_stats.csv")
