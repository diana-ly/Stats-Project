library(XML)
library(dplyr)

setwd("/Users/Diana/Google Drive/Stats 133 Project")

x = htmlParse("colleges.html")
US_colleges = read.csv("US Colleges.csv", stringsAsFactors = FALSE)
US_colleges = US_colleges[ , c("institution.name", "Longitude", "Latitude")]

college_list <- xpathSApply(
  doc = x,
  path = '//select[@class="chosen_select"]/option',
  fun = xmlValue
)


college_list <- gsub("\n", "", college_list)
college_list <- as.data.frame(college_list, stringsAsFactors = FALSE)
colnames(college_list) <- c("institution.name")

