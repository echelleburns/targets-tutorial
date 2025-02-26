# Variables that the function will require include: 
## known_and_sampled: the dataframe that is the result of combine_known_and_sampled(); should have columns for "n" (sample size), "sampled_mean", "sampled_sd", "known_mean", and "known_sd"

calculate_percent_difference <- function(known_and_sampled) { 
  
  known_and_sampled %>% 
    mutate(perc_difference_mean = (sampled_mean - known_mean)/known_mean*100,
           perc_difference_sd = (sampled_sd - known_sd)/known_sd*100
    ) 
}