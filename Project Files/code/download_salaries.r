# This code is used to webscrape the player salaries data from ESPN
# Output is a csv of the raw data we scraped.

library(rvest)

webpage <- "http://espn.go.com/nba/salaries/_/year/2015/page/"
salaries <- data.frame(stringsAsFactors = F)

# Going through each page on the webpage and extracting the table info
# then row binding it into the empty salaries data frame made earlier
for (i in 1:11) {
  page_url <- paste0(webpage, i)
  salary_on_page <- read_html(page_url) %>%
                    html_node(".tablehead") %>%
                    html_table()
  salaries <- rbind(salaries, salary_on_page)
}

write.csv(salaries, "rawdata/raw_salaries.csv")
