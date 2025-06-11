set.seed(5289567)                              # Create example data frame
data <- data.frame(x1 = rnorm(100),
                   x2 = runif(100),
                   x3 = rpois(100, 3),
                   x4 = rlogis(100))
head(data)                                     # Print head of example data frame

#install.packages("ggplot2")                    # Install ggplot2 package
library("ggplot2")                             # Load ggplot2

#install.packages("tidyr")                      # Install & load tidyr package
library("tidyr")

data_long <- data %>%                          # Apply pivot_longer function
  pivot_longer(colnames(data)) %>%
  as.data.frame()
head(data_long)                                # Print head of long data

ggp1 <- ggplot(data_long, aes(x = value)) +    # Draw each column as histogram
  geom_histogram() + 
  facet_wrap(~ name, scales = "free")
ggp1

ggp2 <- ggplot(data_long, aes(x = value)) +    # Draw each column as density
  geom_density() + 
  facet_wrap(~ name, scales = "free")
ggp2

ggp3 <- ggplot(data_long, aes(x = value)) +    # Draw histogram & density
  geom_histogram(aes(y = ..density..)) + 
  geom_density(col = "#1b98e0", size = 2) + 
  facet_wrap(~ name, scales = "free")
ggp3
