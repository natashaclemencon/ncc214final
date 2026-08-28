library(tidyverse)

#Read in necessary dataframes
source("R/movingaverage.R")
bisley1 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca1-Bisley.csv")
bisley2 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca2-Bisley.csv")
bisley3 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca3-Bisley.csv")
puenteroto <- read_csv("data/knb-lter-luq.20.4923064/RioMameyesPuenteRoto.csv")

#Filter the data to have only the necessary years included in the analysis
bisley1 <- filter(
  bisley1,
  Sample_Date >= ymd("1988-01-01") & Sample_Date <= ymd("1994-12-31")
)
bisley2 <- filter(
  bisley2,
  Sample_Date >= ymd("1988-01-01") & Sample_Date <= ymd("1994-12-31")
)
bisley3 <- filter(
  bisley3,
  Sample_Date >= ymd("1988-01-01") & Sample_Date <= ymd("1994-12-31")
)
puenteroto <- filter(
  puenteroto,
  Sample_Date >= ymd("1988-01-01") & Sample_Date <= ymd("1994-12-31")
)

#Calculate the moving averages of each dataframe using the moving average function
movingavg1 <- moving_average(bisley1)
movingavg2 <- moving_average(bisley2)
movingavg3 <- moving_average(bisley3)
movingavgpr <- moving_average(puenteroto)

#Bind together the four moving average data frames
alldata <- bind_rows(movingavg1, movingavg2, movingavg3, movingavgpr)

write_csv(alldata, "output/output.csv")
