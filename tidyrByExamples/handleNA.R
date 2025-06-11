data <- data.frame(x1 = c(4, 1, NA, 7, 8, 1),    # Create example data
                   x2 = c("A", NA, NA, "XX", "YO", "YA"),
                   x3 = c(1, 0, NA, 1, 1, NA))

data1 <- na.omit(data)                           # Apply na.omit function

data2 <- data[complete.cases(data), ]            # Apply complete.cases function

data3 <- data[rowSums(is.na(data)) == 0, ]       # Apply rowSums & is.na

# install.packages("tidyr")                        # Install & load tidyr package
library("tidyr")

data4 <- data %>%  drop_na()                      # Apply drop_na function

data5 <- data[!is.na(data$x1), ]                 # Apply is.na function

#install.packages("dplyr")                        # Install dplyr package
library("dplyr")                                 # Load dplyr package

data6 <- filter(data, !is.na(data$x1))           # Apply filter function
