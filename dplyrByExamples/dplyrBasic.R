## credit: https://statisticsglobe.com/dplyr-r-package
library(dplyr)
data <- data.frame(x1 = 1:6,                # Create example data
                   x2 = c(1, 2, 2, 3, 1, 2),
                   x3 = c("F", "B", "C", "E", "A", "D"))
data 


arrange(data, x3)   

filter(data, x2 == 2)     

mutate(data, x4 = x1 + x2)                  # Apply mutate function

pull(data, x2)                              # Apply pull function

rename(data, new_name = x3)                 # Apply rename function

set.seed(765)                               # Set seed for reproducibility
sample_n(data, 3)                           # Apply sample_n function

select(data, c(x2, x3))                     # Apply select function
