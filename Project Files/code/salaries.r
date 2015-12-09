library(rvest)
library(stringr)

webpage <- "http://espn.go.com/nba/salaries/_/year/2015/page/"
salaries <- data.frame(stringsAsFactors = F)

for (i in 1:11) {
  page_url <- paste0(webpage, i)
  salary_on_page <- read_html(page_url) %>%
                    html_node(".tablehead") %>%
                    html_table()
  salaries <- rbind(salaries, salary_on_page)
}

write.csv(salaries, "raw_salaries.csv")
file.rename("raw_salaries.csv", "rawdata/raw_salaries.csv")



titled_rows <- as.numeric(row.names(subset(salaries, X1 == "RK")))
salaries <- salaries[-c(titled_rows), ]
salaries <- salaries[ , -c(1)]
colnames(salaries) <- c("Player", "Team", "Salary")

for (i in 1:nrow(salaries)) {
  salaries$Position[i] <- str_split(salaries$Player[i], ", ")[[1]][2]
}

salaries$Player <- gsub("(,).*", "", salaries$Player)

write.csv(salaries, "salaries_1415.csv")
