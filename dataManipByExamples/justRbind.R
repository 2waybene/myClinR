data_new <-data.frame(Sepal.Length = c(7.3, 5.5),
                       Sepal.Width = c(2.2, 3.3),
                       Petal.Length = c(10, 20),
                       Petal.Width = c(0.1, 0.1),
                       Species = factor(c("new", "new2")))
data_new              # Print new data set to RStudio console

#Apply rbind function
iris_new <- rbind(iris, data_new)
tail(iris_new)        # Print last 6 rows of combined data set to RStudio console


##### Example 2: rbind.fill function (plyr package) #####

# install.packages("plyr") # Install plyr package (needs to be done only once)
library("plyr")          # Load plyr package (needes to be done after every restart of R)

data(iris)            # Load iris data set
head(iris)            # Print first 6 rows of iris data to RStudio console

## Create new data set with !!!DIFFERENT!!! structure as iris
data_new <- data.frame(Sepal.Length = c(7.3, 5.5),
                       Sepal.Width = c(2.2, 3.3),
                       Petal.Length = c(10, 20),
                       Petal.Width = c(0.1, 0.1))
data_new              # Print new data set to RStudio console

## Apply rbind.fill function
iris_new <- rbind.fill(iris, data_new)
tail(iris_new)        # Print last 6 rows of combined data set to RStudio console
