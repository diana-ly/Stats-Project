# This code cleans the player salaries data
library(stringr)

source("code/download_salaries.R")

salaries <- read.csv("rawdata/raw_salaries.csv", stringsAsFactors = F)

# Removing the divider row that separated each 10 players
titled_rows <- as.numeric(row.names(subset(salaries, X1 == "RK")))
salaries <- salaries[-c(titled_rows), ]
salaries <- salaries[ , -c(1, 2)]
colnames(salaries) <- c("Player", "Team", "Salary")

# Splitting player names from their position

for (i in 1:nrow(salaries)) {
  salaries$Position[i] <- str_split(salaries$Player[i], ", ")[[1]][2]
}

# Removing the commas from player names and $ from salaries to convert
# salaries column into numeric so that it can be plotted later
salaries$Player <- gsub("(,).*", "", salaries$Player)
salaries$Salary <- gsub("\\$", "", salaries$Salary)
salaries$Salary <- as.numeric(gsub(",", "", salaries$Salary))

write.csv(salaries, "data/salaries.csv")

