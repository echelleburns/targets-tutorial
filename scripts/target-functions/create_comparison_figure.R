# Variables that the function will require include: 
## samples: a dataframe that is the result of create_random_samples(); columns should include "n" (number of samples) and "values"  (the actual sampled values)
## percent_differences: a dataframe that is the result of calculate_percent_difference(); columns should include "n" (sample size), "sampled_mean", "sampled_sd", "known_mean", "known_sd", and "perc_difference_mean"

create_comparison_figure <- function(samples, percent_differences) {
  
  ggplot() + 
    geom_histogram(data = samples, 
                   mapping = aes(x = values, 
                                 y = ..count../sum(..count..)),
                   fill = "dodgerblue4", alpha = 0.5) + 
    geom_vline(data = percent_differences, 
               mapping = aes(xintercept = sampled_mean, 
                             linetype = "Sample mean")) + 
    geom_vline(data = percent_differences, 
               mapping = aes(xintercept = known_mean, 
                             linetype = "Known mean")) +
    scale_linetype_manual(values = c("Sample mean" = "solid", 
                                     "Known mean" = "dashed")) + 
    facet_wrap(~n, scales = "free_y") + 
    scale_y_continuous(labels = scales::percent) + 
    labs(x = "Value", 
         y = "Percent of points", 
         linetype = NULL, 
         title = "Sample means by sample size") + 
    theme_classic() + 
    theme(legend.position = "bottom")
} 