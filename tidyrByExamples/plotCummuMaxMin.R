set.seed(967834)                             # Create random example vector
x <- round(rnorm(10, 10, 5))
x                                            # Print example vector

x_cummax <- cummax(x)                        # Apply cummax function
x_cummax                                     # Print cumulative maxima vector

x_cummin <- cummin(x)                        # Apply cummin function
x_cummin                                     # Print cumulative minima vector

data <- data.frame(x, x_cummax, x_cummin)    # Store results in data frame
data                                         # Print data frame with results

#install.packages("tidyr")                    # Install & load tidyr package
library("tidyr")

data_long <- data %>%                       # Convert data frame to long format
  pivot_longer(cols = colnames(data)) %>%
  as.data.frame()
head(data_long)                              # Head of data in long format

#install.packages("ggplot2")                  # Install ggplot2 package
library("ggplot2")                           # Load ggplot2

ggplot(data_long,                            # Draw plot of cumulative max & min
       aes(x = rep(1:(nrow(data_long) / length(table(name))),
                   each = length(table(name))), 
           y = value,
           color = name)) +
  geom_line()
