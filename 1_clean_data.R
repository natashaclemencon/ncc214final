library(tidyverse)

bisley1 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca1-Bisley.csv")
bisley2 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca2-Bisley.csv")
bisley3 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca3-Bisley.csv")
puenteroto <- read_csv("data/knb-lter-luq.20.4923064/RioMameyesPuenteRoto.csv")

movingavg1 <- moving_average(bisley1)
movingavg2 <- moving_average(bisley2)
movingavg3 <- moving_average(bisley3)
movingavgpr <- moving_average(puenteroto)

alldata <- bind_rows(bisley1, bisley2, bisley3, puenteroto)

write_csv(alldata, "output/output.csv")
