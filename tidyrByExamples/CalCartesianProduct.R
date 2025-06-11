
x <- LETTERS[1:4]                   # Create first example vector
x                                   # Print first example vector

y <- letters[1:3]                   # Create second example vector
y                                   # Print second example vector

z <- c("foo", "bar")                # Create third example vector
z                                   # Print third example vector

data_cp1 <- expand.grid(x, y, z)    # Apply expand.grid function
data_cp1                            # Print cartesian product

#install.packages("tidyr")           # Install tidyr package
library("tidyr")                    # Load tidyr

data_cp2 <- crossing(x, y, z)       # Apply crossing function
data_cp2                            # Print cartesian product
