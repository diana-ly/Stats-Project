### Stats 133 Project: NBA Players, Salaries, and Institutions  

#### Description of the Project:
Our project is based on information about the basketball players of the National Basketball Assiociation League 2014-2014 season. We will analyze data on basketball players in the 2014-2015 season to answer the following questions:  

1) __Which college(s) produced the most NBA players in the 2014-2015 season?__
2) __Do the skills of player relate to their salary?__

R packages that used for data gathering, cleaning, and analysis are: 

- __dplyr__
- __ggplot__ 
- __maps__
- __rvest__
- __scales__

#### Authors Information:
__Name, SID, Email__

Stacy Chang, 25282542, stacy.chang@berkeley.edu

Laura Kim, 25517879, laurajisol@berkeley.edu

Diana Ly, 25361087, ddly@berkeley.edu

Jong Ha Lee, 25344865, jonghalee@berkeley.edu  

#### Organization:
  Our project organization follows the example project that was provided by 
Professor Sanchez. One main project directory that consists 6 subdirectories: code, rawdata, data, resources, report, and images. 

- The __code__ directory contains the rmarkdown file for the all the code that we complied to clean the rawdata and to analyze our research questions. 
- The __rawdata__ directory contains the player statistics and team roster data retrieved from  http://www.basketball-reference.com/. The folder also has the 2014-2015 NBA season players salaries data obtained from directly from http://espn.go.com/nba/. Another file in rawdata is the raw US_Colleges.csv file obtained from the ZIP file available at http://nces.ed.gov. 
- The __data directory__ contains all the cleaned data that are compiled by the raw data. The folder includes the CSV files player_stats, roster, roster_salary_stats, salaries, and US_colleges. These datasets contain information about all the players of the 2014-2015 NBA season. player_stats contain the statistics of all players; roster contains the roster information for all players; salaries contain the salaries of all players; and US_colleges contain geolocations of all registered U.S. institutions. roster_salary_stats has the combined data of player_stats, roster, and salaries and is mainly used for our data analysis.
- The __report__ directory includes the knitted PDF file of our final report answers our reserach questions. The PDF has code, plot graphics, etc. 
- The __image__ directory includes the PDF and png images of all the graphs that we produced to answer our research questions.
