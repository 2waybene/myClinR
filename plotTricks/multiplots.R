set.seed(2525)                             # Set seed for reproducibility
x1 <-rnorm(1000)                          # Normally distributed x1
y1 <-x1 + rnorm(1000)                     # Correlated y1

plot(x1, y1, col = "#1b98e0", pch = 8)     # Plot scatterplot of x1 & y1

x2 <-runif(200, -1, 2)                    # Uniformly distributed x2
y2 <- - x2 + runif(200)                    # Correlated y2

points(x2, y2, col = "#353436", pch = 15)  # Overlaying scatterplot of x2 & y2

x3 <- c(0, 2.5, -1, 0)                     # Some points on x-axis
y3 <- c(0, 4, 2, -3)                       # Some points on y-axis                    

lines(x3, y3, col = "yellow", lwd = 3)     # Overlaying line
