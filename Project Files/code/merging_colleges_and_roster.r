# Merging US Colleges and Roster data

library(dplyr)
US_colleges <- read.csv("data/US_colleges.csv", stringsAsFactors = F)
roster <- read.csv("data/roster.csv", stringsAsFactors = F, na.strings = NA)

# Merging US Colleges and Player Colleges
player_colleges <- left_join(roster, US_colleges, by = "College")
US_colleges$College <- gsub("-", " ", US_colleges$College)
player_colleges <- left_join(roster, US_colleges, by = "College")

# Cleaning institutions with multiple locations (inevitable)
pcc <- player_colleges$College
usc <- US_colleges$College

player_colleges$Longitude[pcc == "Arizona State University"] <- 
  US_colleges$Longitude[grep("Arizona State University Downtown Phoenix", usc)] 
player_colleges$Latitude[pcc == "Arizona State University"] <- 
  US_colleges$Latitude[grep("Arizona State University Downtown Phoenix", usc)]

player_colleges$Longitude[pcc == "Colorado State University"] <- 
  US_colleges$Longitude[grep("Colorado State University Fort Collins", usc)] 
player_colleges$Latitude[pcc == "Colorado State University"] <- 
  US_colleges$Latitude[grep("Colorado State University Fort Collins", usc)]

player_colleges$Longitude[pcc == "Georgia Institute of Technology"] <- 
  US_colleges$Longitude[grep("(Georgia Institute of Technology)", usc)] 
player_colleges$Latitude[pcc == "Georgia Institute of Technology"] <- 
  US_colleges$Latitude[grep("(Georgia Institute of Technology)", usc)] 

player_colleges$Longitude[pcc == "Indiana University"] <- 
  US_colleges$Longitude[grep("(Indiana University Bloomington)", usc)] 
player_colleges$Latitude[pcc == "Indiana University"] <- 
  US_colleges$Latitude[grep("(Indiana University Bloomington)", usc)] 

player_colleges$Longitude[pcc == "Indiana University-Purdue University Indianapolis"] <- 
  US_colleges$Longitude[grep("(Indiana University Purdue University Indianapolis)", usc)] 
player_colleges$Latitude[pcc == "Indiana University-Purdue University Indianapolis"] <- 
  US_colleges$Latitude[grep("(Indiana University Purdue University Indianapolis)", usc)] 

player_colleges$Longitude[pcc == "Louisiana State University"] <- 
  US_colleges$Longitude[grep("(Louisiana State University and)", usc)] 
player_colleges$Latitude[pcc == "Louisiana State University"] <- 
  US_colleges$Latitude[grep("(Louisiana State University and)", usc)] 

player_colleges$Longitude[pcc == "New Mexico State University"] <- 
  US_colleges$Longitude[grep("(New Mexico State University Main)", usc)] 
player_colleges$Latitude[pcc == "New Mexico State University"] <- 
  US_colleges$Latitude[grep("(New Mexico State University Main)", usc)] 

player_colleges$Longitude[pcc == "North Carolina State University"] <- 
  US_colleges$Longitude[grep("(North Carolina State University at Raleigh)", usc)] 
player_colleges$Latitude[pcc == "North Carolina State University"] <- 
  US_colleges$Latitude[grep("(North Carolina State University at Raleigh)", usc)] 

player_colleges$Longitude[pcc == "Ohio State University"] <- 
  US_colleges$Longitude[grep("(Ohio State University Main)", usc)] 
player_colleges$Latitude[pcc == "Ohio State University"] <- 
  US_colleges$Latitude[grep("(Ohio State University Main)", usc)] 

player_colleges$Longitude[pcc == "Oklahoma State University"] <- 
  US_colleges$Longitude[grep("(Oklahoma State University Main)", usc)] 
player_colleges$Latitude[pcc == "Oklahoma State University"] <- 
  US_colleges$Latitude[grep("(Oklahoma State University Main)", usc)] 

player_colleges$Longitude[pcc == "Pennsylvania State University"] <- 
  US_colleges$Longitude[grep("(Pennsylvania State University Main)", usc)] 
player_colleges$Latitude[pcc == "Pennsylvania State University"] <- 
  US_colleges$Latitude[grep("(Pennsylvania State University Main)", usc)] 

player_colleges$Longitude[pcc == "Purdue University"] <- 
  US_colleges$Longitude[grep("(Purdue University Main)", usc)] 
player_colleges$Latitude[pcc == "Purdue University"] <- 
  US_colleges$Latitude[grep("(Purdue University Main)", usc)] 

player_colleges$Longitude[pcc == "Brigham Young University"] <- 
  US_colleges$Longitude[grep("(Brigham Young University Provo)", usc)] 
player_colleges$Latitude[pcc == "Brigham Young University"] <- 
  US_colleges$Latitude[grep("(Brigham Young University Provo)", usc)] 

player_colleges$Longitude[pcc == "St. Bonaventure University"] <- 
  US_colleges$Longitude[grep("(St Bonaventure University)", usc)] 
player_colleges$Latitude[pcc == "St. Bonaventure University"] <- 
  US_colleges$Latitude[grep("(St Bonaventure University)", usc)] 

player_colleges$Longitude[pcc == "St. John's University"] <- 
  US_colleges$Longitude[grep("(St John's University New York)", usc)] 
player_colleges$Latitude[pcc == "St. John's University"] <- 
  US_colleges$Latitude[grep("(St John's University New York)", usc)] 

player_colleges$Longitude[pcc == "Texas A&amp;M University"] <- 
  US_colleges$Longitude[grep("(Texas A & M University College)", usc)] 
player_colleges$Latitude[pcc == "Texas A&amp;M University"] <- 
  US_colleges$Latitude[grep("(Texas A & M University College)", usc)] 

player_colleges$Longitude[pcc == "University of Alabama"] <- 
  US_colleges$Longitude[grep("(University of Alabama in Huntsville)", usc)]
player_colleges$Latitude[pcc == "University of Alabama"] <- 
  US_colleges$Latitude[grep("(University of Alabama in Huntsville)", usc)] 

player_colleges$Longitude[pcc == "University of California"] <- 
  US_colleges$Longitude[grep("(University of California Berkeley)", usc)] 
player_colleges$Latitude[pcc == "University of California"] <- 
  US_colleges$Latitude[grep("(University of California Berkeley)", usc)] 

player_colleges$Longitude[pcc == "University of Cincinnati"] <- 
  US_colleges$Longitude[grep("(University of Cincinnati Main)", usc)] 
player_colleges$Latitude[pcc == "University of Cincinnati"] <- 
  US_colleges$Latitude[grep("(University of Cincinnati Main)", usc)] 

player_colleges$Longitude[pcc == "University of Colorado"] <- 
  US_colleges$Longitude[grep("(University of Colorado Boulder)", usc)] 
player_colleges$Latitude[pcc == "University of Colorado"] <- 
  US_colleges$Latitude[grep("(University of Colorado Boulder)", usc)] 

player_colleges$Longitude[pcc == "University of Illinois at Urbana-Champaign"] <- 
  US_colleges$Longitude[grep("(University of Illinois at Urbana)", usc)] 
player_colleges$Latitude[pcc == "University of Illinois at Urbana-Champaign"] <- 
  US_colleges$Latitude[grep("(University of Illinois at Urbana)", usc)] 

player_colleges$Longitude[pcc == "University of Maryland"] <- 
  US_colleges$Longitude[grep("(University of Maryland College)", usc)] 
player_colleges$Latitude[pcc == "University of Maryland"] <- 
  US_colleges$Latitude[grep("(University of Maryland College)", usc)] 

player_colleges$Longitude[pcc == "University of Michigan"] <- 
  US_colleges$Longitude[grep("(University of Michigan Ann Arbor)", usc)] 
player_colleges$Latitude[pcc == "University of Michigan"] <- 
  US_colleges$Latitude[grep("(University of Michigan Ann Arbor)", usc)] 

player_colleges$Longitude[pcc == "University of Missouri"] <- 
  US_colleges$Longitude[grep("(University of Missouri Columbia)", usc)] 
player_colleges$Latitude[pcc == "University of Missouri"] <- 
  US_colleges$Latitude[grep("(University of Missouri Columbia)", usc)] 

player_colleges$Longitude[pcc == "University of Minnesota"] <- 
  US_colleges$Longitude[grep("(University of Minnesota Twin Cities)", usc)] 
player_colleges$Latitude[pcc == "University of Minnesota"] <- 
  US_colleges$Latitude[grep("(University of Minnesota Twin Cities)", usc)] 

player_colleges$Longitude[pcc == "University of New Mexico"] <- 
  US_colleges$Longitude[grep("(University of New Mexico Main)", usc)] 
player_colleges$Latitude[pcc == "University of New Mexico"] <- 
  US_colleges$Latitude[grep("(University of New Mexico Main)", usc)] 

player_colleges$Longitude[pcc == "University of North Carolina"] <- 
  US_colleges$Longitude[grep("(University of North Carolina at Chapel Hill)", usc)] 
player_colleges$Latitude[pcc == "University of North Carolina"] <- 
  US_colleges$Latitude[grep("(University of North Carolina at Chapel Hill)", usc)] 

player_colleges$Longitude[pcc == "University of Oklahoma"] <- 
  US_colleges$Longitude[grep("(University of Oklahoma Norman)", usc)] 
player_colleges$Latitude[pcc == "University of Oklahoma"] <- 
  US_colleges$Latitude[grep("(University of Oklahoma Norman)", usc)] 

player_colleges$Longitude[pcc == "University of Pittsburgh"] <- 
  US_colleges$Longitude[grep("(University of Pittsburgh Pittsburgh)", usc)] 
player_colleges$Latitude[pcc == "University of Pittsburgh"] <- 
  US_colleges$Latitude[grep("(University of Pittsburgh Pittsburgh)", usc)] 

player_colleges$Longitude[pcc == "University of Texas at Austin"] <- 
  US_colleges$Longitude[grep("(The University of Texas at Austin)", usc)] 
player_colleges$Latitude[pcc == "University of Texas at Austin"] <- 
  US_colleges$Latitude[grep("(The University of Texas at Austin)", usc)] 

player_colleges$Longitude[pcc == "University of Montana"] <- 
  US_colleges$Longitude[grep("(The University of Montana)$", usc)] 
player_colleges$Latitude[pcc == "University of Montana"] <- 
  US_colleges$Latitude[grep("(The University of Montana)$", usc)] 

player_colleges$Longitude[pcc == "University of Tennessee"] <- 
  US_colleges$Longitude[grep("(The University of Tennessee Knoxville)", usc)] 
player_colleges$Latitude[pcc == "University of Tennessee"] <- 
  US_colleges$Latitude[grep("(The University of Tennessee Knoxville)", usc)] 

player_colleges$Longitude[pcc == "University of Tennessee at Martin"] <- 
  US_colleges$Longitude[grep("(The University of Texas at Austin)", usc)] 
player_colleges$Latitude[pcc == "University of Tennessee at Martin"] <- 
  US_colleges$Latitude[grep("(The University of Texas at Austin)", usc)] 

player_colleges$Longitude[pcc == "University of Virginia"] <- 
  US_colleges$Longitude[grep("(University of Virginia Main)", usc)] 
player_colleges$Latitude[pcc == "University of Virginia"] <- 
  US_colleges$Latitude[grep("(University of Virginia Main)", usc)] 

player_colleges$Longitude[pcc == "University of Washington"] <- 
  US_colleges$Longitude[grep("(University of Washington Seattle)", usc)] 
player_colleges$Latitude[pcc == "University of Washington"] <- 
  US_colleges$Latitude[grep("(University of Washington Seattle)", usc)] 

player_colleges$Longitude[pcc == "University of Wisconsin"] <- 
  US_colleges$Longitude[grep("(University of Wisconsin Madison)", usc)] 
player_colleges$Latitude[pcc == "University of Wisconsin"] <- 
  US_colleges$Latitude[grep("(University of Wisconsin Madison)", usc)] 

player_colleges$Longitude[pcc == "Utah Valley State College"] <- 
  US_colleges$Longitude[grep("(Utah Valley University)", usc)] 
player_colleges$Latitude[pcc == "Utah Valley State College"] <- 
  US_colleges$Latitude[grep("(Utah Valley University)", usc)] 

# Adding 'No college / university' to players who did not attend college
for (i in 1:length(rownames(player_colleges))) {
  if (player_colleges$College[i] == "") {
    player_colleges$College[i] <- "No college / university"
  }
}

write.csv(player_colleges, "data/player_colleges.csv")