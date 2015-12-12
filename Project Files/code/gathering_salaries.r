library(rvest)

# Getting the data from ESPN and saving the raw data
webpage <- "http://espn.go.com/nba/salaries/_/year/2015/page/"
salaries <- data.frame(stringsAsFactors = F)

for (i in 1:11) {
  page_url <- paste0(webpage, i)
  salary_on_page <- read_html(page_url) %>%
                    html_node(".tablehead") %>%
                    html_table()
  salaries <- rbind(salaries, salary_on_page)
}

write.csv(salaries, "rawdata/raw_salaries.csv")
