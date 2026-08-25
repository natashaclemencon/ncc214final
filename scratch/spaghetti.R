library(tidyverse)

bisley1 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca1-Bisley.csv")
bisley2 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca2-Bisley.csv")
bisley3 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca3-Bisley.csv")
puenteroto <- read_csv("data/knb-lter-luq.20.4923064/RioMameyesPuenteRoto.csv")


alldata <- bind_rows(bisley1, bisley2, bisley3, puenteroto)


Pivoted_bisley1 <- bisley1 |>
  pivot_longer(
    cols = "NO3-N":"NH4-N",
    names_to = "Ion",
    values_to = "Concentration"
  )

ggplot(
  data = Pivoted_bisley1,
  mapping = aes(x = Sample_Date, y = Concentration, color = Ion)
) +
  geom_point() +
  facet_wrap(~Ion)
