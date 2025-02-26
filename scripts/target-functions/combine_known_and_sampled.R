# Variables that the function will require include: 
## samples: a dataframe that is the result of create_random_samples(); columns should include "n" (number of samples) and "values"  (the actual sampled values)
## known_mean: the known mean of the population
## known_sd: the known sd of the population

combine_known_and_sampled <- function(samples, known_mean, known_sd) { 
  
  samples %>%
    group_by(n) %>% 
    summarise(sampled_mean = mean(values, na.rm = T), 
              sampled_sd = sd(values, na.rm = T)) %>% 
    ungroup() %>% 
    mutate(known_mean = known_mean, 
           known_sd = known_sd)
}