# Create a moving average function to input the four site data frames into
moving_average <- function(data) {
  library(tidyverse)
  # Initialize a tibble to contain the results
  result <- tibble(
    window_start = seq(
      (data$Sample_Date[1]),
      (data$Sample_Date[nrow(data)]),
      by = "9 weeks"
    ),
    Site = data$Sample_ID[1],
    #Include the ions in Figure 3 as columns in the tibble
    K = NA,
    NO3 = NA,
    Mg = NA,
    Na = NA,
    NH4N = NA
  )
  #Create the 9 week windows
  for (i in 1:nrow(result)) {
    w1 <- result$window_start[i]
    w2 <- w1 + (9 * 7)

    # Tell it which samples are in the window
    in_window <- data$Sample_Date >= w1 & data$Sample_Date < w2

    # Use indexing to pull out the ion concentrations that fall inside the window
    K_in_window <- data$K[in_window]
    Mg_in_window <- data$Mg[in_window]
    NO3_in_window <- data$`NO3-N`[in_window]
    Na_in_window <- data$Na[in_window]
    NH4N_in_window <- data$`NH4-N`[in_window]

    # Calculate the mean of each ion concentration to enter into the tibble
    result$K[i] <- mean(K_in_window, na.rm = TRUE)
    result$Mg[i] <- mean(Mg_in_window, na.rm = TRUE)
    result$NO3[i] <- mean(NO3_in_window, na.rm = TRUE)
    result$Na[i] <- mean(Na_in_window, na.rm = TRUE)
    result$NH4N[i] <- mean(NH4N_in_window, na.rm = TRUE)
  }
  return(result)
}
