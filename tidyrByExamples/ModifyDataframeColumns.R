##==============================
##  tidyr: separate function
##==============================
data <- data.frame (x=c("a-1","b-2", "c-3"))


##### Example 1

data.frame(do.call("rbind", strsplit(as.character(data$x), "-", fixed = TRUE)))

##### Example 2

# install.packages("stringr")
library("stringr")

str_split_fixed(data$x, "-", 2)

##### Example 3

#install.packages("tidyr")
library("tidyr")

data %>% separate(x, c("col1", "col2"), "-")
