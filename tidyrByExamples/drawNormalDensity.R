
set.seed(35486)                    # Create random distributions
data <- data.frame(x1 = rbeta(1000, 10, 2),
                   x2 = rbeta(1000, 5, 2),
                   x3 = rnorm(1000),
                   x4 = rbeta(1000, 2, 5),
                   x5 = rbeta(1000, 2, 10))

plot(density(data$x1), col = 2,    # Overlay all columns as densities
     xlim = c(- 3, 3),
     ylim = c(0, 5))
lines(density(data$x2), col = 3)
lines(density(data$x3), col = 4)
lines(density(data$x4), col = 5)
lines(density(data$x5), col = 6)
legend("topleft",                  # Add legend to plot
       legend = c("x1 = rbeta(1000, 10, 2)",
                  "x2 = rbeta(1000, 5, 2)",
                  "x3 = rnorm(1000)",
                  "x4 = rbeta(1000, 2, 5)",
                  "x5 = rbeta(1000, 2, 10)"),
       col = 2:6,
       lty = 1,
       cex = 0.8)

# install.packages("tidyr")          # Install & load tidyr
library("tidyr")

data_long <- data %>%              # Convert wide to long data
  pivot_longer(colnames(data)) %>%
  as.data.frame()

#install.packages("ggplot2")        # Install ggplot2 package
library("ggplot2")                 # Load ggplot2 package

ggplot(data_long,                  # Draw all densities in ggplot2 plot
       aes(value,
           fill = name)) +
  geom_density(alpha = 0.25)
