# Gathering and Cleaning the US Colleges data from IPEDS

download.file("http://nces.ed.gov/ipeds/datacenter/data/HD2014.zip", 
              "rawdata/US_colleges_raw.zip")

US_colleges_raw <- read.csv(unz("rawdata/US_colleges_raw.zip", "hd2014.csv"),
                            stringsAsFactors = F)

US_colleges <- US_colleges_raw[c("INSTNM", "LONGITUD", "LATITUDE")]
colnames(US_colleges) <- c("College", "Longitude", "Latitude")

write.csv(US_colleges, "data/US_colleges.csv")
