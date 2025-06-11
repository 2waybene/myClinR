set.seed(6857323)                                                  # Set random seed for reproducibility
data <- data.frame(x1 = sample(letters[1:5], 10, replace = TRUE),  # Create example data frame
                   x2 = sample(letters[1:5], 10, replace = TRUE),
                   x3 = sample(letters[1:5], 10, replace = TRUE))

# install.packages("tidyr")                                          # Install & load tidyr
library("tidyr")

data_long <- data                                                  # Duplicate data frame
data_long$id <- paste0("id", 1:nrow(data_long))                    # Add ID column
data_long <- pivot_longer(data_long, colnames(data))               # Reshape to long format

# install.packages("ggplot2")                                        # Install & load ggplot2 package
library("ggplot2")

ggplot(data_long,                                                  # Draw heatmap-like plot
       aes(name, id, fill = value)) +
  geom_tile()
