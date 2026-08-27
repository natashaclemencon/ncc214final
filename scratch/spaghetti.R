source("R/movingaverage.R")

library(tidyverse)

alldata <- read_csv("output/output.csv")


pivotedallplot <- alldata |>
  pivot_longer(
    cols = c(K, NO3, Mg, Na, NH4N),
    names_to = "Ion",
    values_to = "Concentration"
  ) |>
  ggplot(
    mapping = aes(x = Sample_Date, y = Concentration, color = Site)
  ) +
  geom_point() +
  facet_wrap(~Ion)

pivotedallplot


##### bad
Pivoted_bisley3 <- bisley3 |>
  pivot_longer(
    cols = "NO3-N":"NH4-N",
    names_to = "Ion",
    values_to = "Concentration"
  )

ggplot(
  data = Pivoted_bisley3,
  mapping = aes(x = Sample_Date, y = Concentration, color = Ion)
) +
  geom_point() +
  facet_wrap(~Ion)


bisley_windows <- tibble(
  window_start = seq(
    bisley1$Sample_Date[1],
    bisley1$Sample_Date[nrow(bisley1)],
    by = "9 weeks"
  ),
  K = NA,
  NO3 = NA,
  Mg = NA,
  Na = NA,
  NH4N = NA
)

#Fills in qs_smooth with mean values inside windows
for (i in 1:nrow(bisley_windows)) {
  w1 <- bisley_windows$window_start[i]
  w2 <- w1 + (9 * 7)

  filtereddata <- filter(bisley1, (Sample_Date >= w1 & Sample_Date < w2))
  bisley_windows$K[i] <- mean(filtereddata$K, na.rm = TRUE)
  bisley_windows$Mg[i] <- mean(filtereddata$Mg, na.rm = TRUE)
  bisley_windows$NO3[i] <- mean(filtereddata$`NO3-N`, na.rm = TRUE)
  bisley_windows$Na[i] <- mean(filtereddata$Na, na.rm = TRUE)
  bisley_windows$NH4N[i] <- mean(filtereddata$`NH4-N`, na.rm = TRUE)
}

Pivoted_bisley1 <- bisley_windows |>
  pivot_longer(
    cols = c(K, Mg, NO3, Na, NH4N),
    names_to = "Ion",
    values_to = "Concentration"
  )

ggplot(
  data = Pivoted_bisley1,
  mapping = aes(x = window_start, y = Concentration, color = Ion)
) +
  geom_point() +
  facet_wrap(~Ion, scales = "free")

## do i now need to just do all of this exact stuff but w my big dataset

##thursday work
