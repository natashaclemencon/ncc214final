library(tidyverse)
site_water_chem_graph <- read_csv("output/output.csv")

# Suggestion: It may be helpful to include units in ion column names in output.csv. Ex. K_mgl.
# Also, I see a Na column but not a Ca column.

# Move ion names to their own column and ion concentrations to their own column ----
Figure_3_Reproduction <- site_water_chem_graph |>
  pivot_longer(
    cols = c(NH4N, Na, Mg, NO3, K),
    names_to = "ion",
    values_to = "concentration"
  )

# Priscilla's ggplot code for graphing ion concentrations for each site

ggplot(
  data = Figure_3_Reproduction,
  mapping = aes(
    x = window_start,
    y = concentration,
    color = Site
  )
) +
  geom_point() +
  geom_line() +
  scale_x_date(name = "Years") +
  facet_wrap(~ion, scales = "free") # splits into five graphs, one for each ion. scales = "free" allows y axis values to adjust to the proper scale for each graph
ggsave("scratch/figure-3-reproduction.png") # saves graph as .png in scratch file (I created a blank figure-3-reproduction.png file first)
