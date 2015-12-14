# Cleaning rawdata for roster and player_stats, and outputing clean data

# The purpose of this code is to read the csv files that we obtained from 
# basketball-reference.com. In total 60 files, 2 files for each team, 
# one file is the team roster and the other is the each player's stats in the 
# 2014-2015 season. 

# Note: We do not download/output raw data, as we can directly download
# and read csv file from github repository and is more efficient.

library(dplyr)

team_names <- c('76ers', 'Bucks', 'Bulls', 'Cavaliers', 'Celtics', 'Clippers',
                'Griz', 'Hawks', 'Heat', 'Hornets', 'Jazz', 'Kings', 'Knicks', 
                'Lakers', 'Magic', 'Mavs', 'Nets', 'Nuggets', 'Pacers', 
                'Pelicans', 'Pistons', 'Raptors', 'Rockets', 'Spurs', 
                'Suns', 'TB', 'Thunder', 'Timberwolves', 'Warriors', 'Wizards')

# Read the CSV files from our github directories and add column team
roster <- data.frame()
player_stats <- data.frame()
roster_link <- "https://raw.githubusercontent.com/diana-ly/Stats-Project/master
/Project%20Files/rawdata/roster_data/"
stat_link <- "https://raw.githubusercontent.com/diana-ly/Stats-Project/master
/Project%20Files/rawdata/stat_data/"

roster_link <- gsub("\n","",roster_link)
stat_link <- gsub("\n", "", stat_link)

for(i in 1:length(team_names)){
  team <- read.csv(paste0(roster_link,team_names[i],"_Roster.csv"))
  stat <- read.csv(paste0(stat_link,team_names[i],".csv"))
  
  team$Team <- team_names[i]
  stat$Team <- team_names[i]
  
  player_stats <- rbind(player_stats, stat)
  roster <- rbind(roster, team)
}

#In each team stats CSV file, get rid of last row "Team Totals"
player_stats <- player_stats[-which(player_stats$Player == "Team Totals"), ]

write.csv(player_stats, file = "data/player_stats.csv")
write.csv(roster, file = "data/roster.csv")
