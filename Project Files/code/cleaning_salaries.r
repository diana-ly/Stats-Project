# This code cleans the player salaries data and outputs the clean data.

library(stringr)

source("./code/download_salaries.R")

# Removing the divider row that separated each 10 players
titled_rows <- as.numeric(row.names(subset(salaries, X1 == "RK")))
salaries <- salaries[-c(titled_rows), ]
salaries <- salaries[ , -1]
colnames(salaries) <- c("Player", "Team", "Salary")

# Splitting player names from their position
for (i in 1:nrow(salaries)) {
  salaries$Position[i] <- str_split(salaries$Player[i], ", ")[[1]][2]
}

# String manipulation of salaries to convert column into numeric
salaries$Player <- gsub("(,).*", "", salaries$Player)
salaries$Salary <- gsub("\\$", "", salaries$Salary)
salaries$Salary <- as.numeric(gsub(",", "", salaries$Salary))

write.csv(salaries, "data/salaries.csv")

