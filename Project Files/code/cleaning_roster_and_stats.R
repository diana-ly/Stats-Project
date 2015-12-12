# Cleaning rawdata for roster and player_stats

# The purpose of these code is to read the csv files that we obtained from 
# basketball-reference.com. In total 60 files, 2 files for each individual team, 
# one file is the team roster and the other is the each player's stats in the 
# 2014-2015 season. 
library(dplyr)

# We first made a vector of all the team names
team_names <- c('76ers', 'Bucks', 'Bulls', 'Cavaliers', 'Celtics', 'Clippers', 'Griz', 'Hawks', 'Heat', 'Hornets', 'Jazz', 'Kings', 'Knicks', 'Lakers', 'Magic', 'Mavs', 'Nets', 'Nuggets', 'Pacers', 'Pelicans', 'Pistons', 'Raptors', 'Rockets', 'Spurs', 'Suns', 'TB', 'Thunder', 'Timberwolves', 'Warriors', 'Wizards')

# Then we made two empty data frame for roster and player_stats. We read the CSV 
# files from our github directories and added column 'Team' to each file by usinig
# the team_names vector that we made above. 
roster <- data.frame()
player_stats <- data.frame()
roster_link <- "https://raw.githubusercontent.com/diana-ly/Stats-Project/master/Project%20Files/rawdata/roster_data/"
stat_link <- "https://raw.githubusercontent.com/diana-ly/Stats-Project/master/Project%20Files/rawdata/stat_data/"
for(i in 1:length(team_names)){
  team <- read.csv(paste0(roster_link,team_names[i],"_Roster.csv"))
  stat <- read.csv(paste0(stat_link,team_names[i],".csv"))
  
  team$Team <- team_names[i]
  stat$Team <- team_names[i]
  
  player_stats <- rbind(player_stats, stat)
  roster <- rbind(roster, team)
}
# In each team stats CSV file, the last row of the file is "Team Totals", which is
# not relevent to the player stats that we need in our project
player_stats <- player_stats[-which(player_stats$Player == "Team Totals"), ]

# Lastly, we wrote the CSV files into the respective directories in github. 
write.csv(player_stats, file = "data/player_stats.csv")
write.csv(roster, file = "data/roster.csv")
