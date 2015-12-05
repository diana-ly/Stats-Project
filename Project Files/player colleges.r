library(XML)
library(dplyr)
library(maps)

# Retrieve Data
player_colleges_html = htmlParse("http://www.basketball-reference.com/friv/colleges.cgi")
US_colleges = read.csv("https://raw.githubusercontent.com/diana-ly/Stats/master/Project%20Files/US%20Colleges.csv", 
                       stringsAsFactors = FALSE)

# Cleaning Data
US_colleges = US_colleges[ , c("institution.name", "Longitude", "Latitude")]

player_colleges <- xpathSApply(
  doc = player_colleges_html,
  path = '//select[@class="chosen_select"]/option',
  fun = xmlValue
)


player_colleges <- gsub("\n", "", player_colleges)
player_colleges <- as.data.frame(player_colleges, stringsAsFactors = FALSE)
colnames(player_colleges) <- c("institution.name")


# Graph Code
par(mar = c(1, 1, 1, 1))
map("state", boundary = TRUE, interior = TRUE, lty = 1, add = FALSE)
points(colleges$Longitude, colleges$Latitude, pch = 20, cex = 0.1)