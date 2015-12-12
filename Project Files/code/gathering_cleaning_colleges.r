# This code is used to obtain the raw US Colleges in ZIP format from NCES
# The code downloads the file into rawdata, unzips it, extracts the needed columns,
# renames those columns, and writes it as a cleaned csv in the data directory.

download.file("http://nces.ed.gov/ipeds/datacenter/data/HD2014.zip", 
              "rawdata/US_colleges_raw.zip")

US_colleges_raw <- read.csv(unz("rawdata/US_colleges_raw.zip", "hd2014.csv"),
                            stringsAsFactors = F)

US_colleges <- US_colleges_raw[c("INSTNM", "LONGITUD", "LATITUDE")]
colnames(US_colleges) <- c("College", "Longitude", "Latitude")

write.csv(US_colleges, "data/US_colleges.csv")
