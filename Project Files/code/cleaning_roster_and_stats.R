library(dplyr)

team_names <- c('76ers', 'Bucks', 'Bulls', 'Cavaliers', 'Celtics', 'Clippers', 'Griz', 'Hawks', 'Heat', 'Hornets', 'Jazz', 'Kings', 'Knicks', 'Lakers', 'Magic', 'Mavs', 'Nets', 'Nuggets', 'Pacers', 'Pelicans', 'Pistons', 'Raptors', 'Rockets', 'Spurs', 'Suns', 'TB', 'Thunder', 'Timberwolves', 'Warriors', 'Wizards')

roster <- data.frame()
player_stats <- data.frame()
for(i in 1:length(team_names)){
  team <- read.csv(paste0("https://raw.githubusercontent.com/diana-ly/Stats-Project/master/Project%20Files/rawdata/Roster%20Raw%20Data/",team_names[i],"_Roster.csv"))
  stat <- read.csv(paste0("https://raw.githubusercontent.com/diana-ly/Stats-Project/master/Project%20Files/rawdata/Team%20Stats%20Raw%20Data/",team_names[i],".csv"))
  
  team$Team <- team_names[i]
  stat$Team <- team_names[i]
  
  player_stats <- rbind(player_stats, stat)
  roster <- rbind(roster, team)
}

player_stats <- player_stats[-which(player_stats$Player == "Team Totals"), ]

write.csv(player_stats, file = "data/player_stats.csv")
write.csv(roster, file = "data/roster.csv")