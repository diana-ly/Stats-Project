### Stats 133 Project: NBA Players, Salaries, and Institutions  

#### Description of the Project:
Our project is based on information about the basketball players of the National Basketball Assiociation League 2014-2014 season. We will analyze data on basketball players in the 2014-2015 season to answer the following questions:  

1. __In the 2014-2015 season, do the skills of player relate to their salary?__

2. __Which college(s) produced the most NBA players in the 2014-2015 season?__


R packages that are used in this project are: 

- __dplyr__
- __ggplot__ 
- __rvest__
- __scales__
- __stringr__
- __maps__



#### Authors Information:
__Name, SID, Email__

Stacy Chang, 25282542, stacy.chang@berkeley.edu

Laura Kim, 25517879, laurajisol@berkeley.edu

Diana Ly, 25361087, ddly@berkeley.edu

Jong Ha Lee, 25344865, jonghalee@berkeley.edu  



#### Organization:
  Our project organization follows the example project that was provided by 
Professor Sanchez. Our main project directory, as created through R Project, consists of five subdirectories: code, rawdata, data, report, and images. Also, it includes __skeleton.R__, which creates the necessary directories outlined below.

- The __code__ directory contains the rmarkdown file for the all the code that we complied to clean the rawdata and to analyze our research questions. It also contains a script with user-created functions, for reference purposes.
- The __rawdata__ directory contains the player statistics and team roster data retrieved from  http://www.basketball-reference.com/. The folder also has the 2014-2015 NBA season players salaries data obtained from directly from http://espn.go.com/nba/. Another file in rawdata is the raw US_Colleges_raw.zip file obtained from the ZIP file available at http://nces.ed.gov. Also, the rawdata directory contains two subdirectories, roster_data and stat_data, which contains the raw data files of each NBA team's roster, and payer statistics respectively. Though we did not directly use the raw data through our subdirectories in our R code scripts (since we used it directly through github links), we did include it for reference purposes. In addition, the __rawdata__ directory includes the metadata for the raw data we used in the project.
- The __data__ directory contains all the cleaned data that are compiled by the raw data. The folder includes the CSV files player_stats, roster, roster_salary_stats, salaries, US_colleges, and player_colleges. These datasets contain information about all the players of the 2014-2015 NBA season. player_stats contain the statistics of all players; roster contains the roster information for all players; salaries contain the salaries of all players; US_colleges contain geolocations of all registered U.S. institutions; and the rest of the data files are a combination of the mentioned data frames.
- The __report__ directory includes the knitted PDF file and R Markdown file of our final report answers our reserach questions. The PDF has code, plot graphics, etc. 
- The __image__ directory includes the PDF and png images of all the graphs that we produced to answer our research questions.



#### Miscellaneous:
We suggest the reader to go through our project code scripts in the following order, for enhanced reproducibility:

i) functions.r

##### Part 1: In the 2014-2015 season, do the skills of player relate to their salary?
1. download_salaries.r
2. cleaning_salaries.r
3. cleaning_roster_and_stats.r
4. cleaning_roster_salary_stats.r
5. visualization_stats_and_salaries.r

##### Part 2: Which college(s) produced the most NBA players in the 2014-2015 season?
1. gathering_cleaning_colleges.r
2. merging_colleges_roster.r
3. visualization_college_and_players.r
