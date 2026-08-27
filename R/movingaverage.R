# The input to this function should be a data frame containing stream chemistry data
moving_average <- function(data) {
  library(tidyverse)
  # Initialize a tibble to contain the results
  result <- tibble(
    window_start = seq(
      data$Sample_Date[1],
      data$Sample_Date[nrow(data)],
      by = "9 weeks"
    ),
    Site = data$Sample_ID[1],
    K = NA,
    NO3 = NA,
    Mg = NA,
    Na = NA,
    NH4N = NA
    # Fill in the rest of the ions
  )

  # Fill in the iterator and sequence
  for (i in 1:nrow(result)) {
    # Create variables for the start and end of the current window
    w1 <- result$window_start[i]
    w2 <- w1 + (9 * 7)

    # Create a logical vector, called "in_window", that says which samples are inside the window
    # Hint: you'll compare sample dates to the start and end of the window
    in_window <- data$Sample_Date >= w1 & data$Sample_Date < w2

    # Use indexing to pull out the ion concentrations that fall inside the window
    K_in_window <- data$K[in_window]
    Mg_in_window <- data$Mg[in_window]
    NO3_in_window <- data$`NO3-N`[in_window]
    Na_in_window <- data$Na[in_window]
    NH4N_in_window <- data$`NH4-N`[in_window]

    # The line above gets potassium in the window. Get the rest of the ions too

    # Calculate the mean of each ion concentration and fill in the result
    result$K[i] <- mean(K_in_window, na.rm = TRUE)
    result$Mg[i] <- mean(Mg_in_window, na.rm = TRUE)
    result$NO3[i] <- mean(NO3_in_window, na.rm = TRUE)
    result$Na[i] <- mean(Na_in_window, na.rm = TRUE)
    result$NH4N[i] <- mean(NH4N_in_window, na.rm = TRUE)
  }
  return(result)
}
