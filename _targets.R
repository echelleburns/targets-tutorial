# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline

# Load packages required to define the pipeline:
library(targets)

# Set target options:
tar_option_set(
  packages = c("tibble", "tidyverse")
)

# Run the R scripts in the R/ folder with your custom functions:
lapply(list.files("scripts/target-functions", full.names = TRUE), source)

# Replaced the target list below with our own:
list(
  
  # Define known means and desired sample sizes
  tar_target(name = known_mean, command = 17), 
  tar_target(name = known_sd, command = 2), 
  tar_target(name = sample_sizes, command = c(10, 1000, 10000)), 
  
  # Generate random samples
  tar_target(name = random_all, 
             command = create_random_samples(n = sample_sizes, 
                                             known_mean = known_mean,
                                             known_sd = known_sd)), 
  
  # Calculate means and sds of interest
  tar_target(name = combined_data_summaries, 
             command = combine_known_and_sampled(samples = random_all, 
                                                 known_mean = known_mean, 
                                                 known_sd = known_sd)), 
  
  # Calculate percent differences
  tar_target(name = percent_differences, 
             command = calculate_percent_difference(combined_data_summaries)), 
  
  # Generate figure
  tar_target(name = comparison_figure, 
             command = create_comparison_figure(samples = random_all, 
                                                 percent_differences = percent_differences))
)