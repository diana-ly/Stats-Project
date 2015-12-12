# Loading all required files
roster <- read.csv('data/roster.csv', stringsAsFactors = F)
player_stats <- read.csv('data/player_stats.csv', stringsAsFactors = F)
salary <- read.csv('data/salaries_1415.csv', stringsAsFactors = F)

# Merging player statistics with salary based on playername
stats_salary <- left_join(player_stats, salary, by = 'Player')
stats_salary <- subset(stats_salary, select = -c(Team.y, X.y, X.x, Position))

for (i in 1:length(row.names(stats_salary))) {
  if (is.na(stats_salary[i,]$Salary)) {
    stats_salary <- stats_salary[-c(i), ]
  }
}

write.csv(stats_salary, "data/stats_and_salary.csv")

# Merging roster to stats_salary get player positions
position <- subset(roster, select = c(Player, Pos))
stats_salary_pos <- unique(left_join(stats_salary, position, by = 'Player'))

for (i in 1:length(row.names(stats_salary_pos))) {
  if (is.na(stats_salary_pos[i,]$Salary)) {
    stats_salary_pos <- stats_salary_pos[-c(i), ]
  }
}

write.csv(stats_salary_pos, "data/final_roster.csv")