#Creating directories
dir.create("code")
dir.create("rawdata")
dir.create("data")
dir.create("images")
dir.create("report")

download.file("http://nces.ed.gov/ipeds/datacenter/data/HD2014.zip", 
              "rawdata/US_colleges_raw.zip")