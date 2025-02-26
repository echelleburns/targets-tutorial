# Variables that the function will require include: 
## n: the sample size to generate; this can be a vector of multiple values (e.g., c(10, 100)) or just a single value (100)
## known_mean: the known mean from which to sample
## known_sd: the known sd from which to sample

create_random_samples <- function(n, known_mean, known_sd) { 
  
  # Set the seed first, so that we can have reproducible results
  set.seed(1234)
  
  # We can use purrr like a for loop to iterate through all 
  # values of n that we provide and automatically creates a 
  # master dataframe
  random_vals <- purrr::map_df(.x = n, 
                               .f = ~{
                                 rnorm(n = .x, mean = known_mean, sd = known_sd) %>% 
                                   as.data.frame() %>% 
                                   rename(values = 1) %>%
                                   mutate(n = .x)
                               })
  
  # Return these values
  return(random_vals)
}