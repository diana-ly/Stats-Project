library(stringr)

source("code/download_salaries.R")

salaries <- read.csv("rawdata/raw_salaries.csv", stringsAsFactors = F)

titled_rows <- as.numeric(row.names(subset(salaries, X1 == "RK")))
salaries <- salaries[-c(titled_rows), ]
salaries <- salaries[ , -c(1, 2)]
colnames(salaries) <- c("Player", "Team", "Salary")

for (i in 1:nrow(salaries)) {
  salaries$Position[i] <- str_split(salaries$Player[i], ", ")[[1]][2]
}

salaries$Player <- gsub("(,).*", "", salaries$Player)
salaries$Salary <- gsub("\\$", "", salaries$Salary)
salaries$Salary <- as.numeric(gsub(",", "", salaries$Salary))

write.csv(salaries, "data/salaries.csv")

