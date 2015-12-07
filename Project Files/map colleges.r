library(dplyr)
library(maps)

roster <- read.csv("https://raw.githubusercontent.com/diana-ly/Stats/master/Project%20Files/roster",
                   stringsAsFactors = F, na.strings = NA)

US_colleges <- read.csv("https://raw.githubusercontent.com/diana-ly/Stats/master/Project%20Files/US%20Colleges.csv", 
                       stringsAsFactors = FALSE)
US_colleges <- US_colleges[ , c("institution.name", "Longitude", "Latitude")]
colnames(US_colleges) <- c("College", "Longitude", "Latitude")
US_colleges$College <- gsub("[[:punct:]*]", " ", US_colleges$College)

player_colleges <- left_join(roster, US_colleges, by = "College")


par(mar = c(1, 1, 1, 1))
map("state", boundary = TRUE, interior = TRUE, lty = 1, add = FALSE)
points(mapped_colleges$Longitude, mapped_colleges$Latitude, 
       pch = 20, cex = 0.4, col = "#0000ff")
