library(data.table)


N <- 100000                                              # Number of observations
set.seed(6)                                              # Set seed for reproducible results
DT_1 <- data.table( "A" = rnorm(N),                      # Create a data.table
                    "B" = rpois(N, 5),
                    "C" = sample(c(TRUE, FALSE),       N, replace = TRUE),
                    "D" = factor(sample(letters[1:20], N, replace = TRUE)),
                    "E" = sample(month.abb[1:12],      N, replace = TRUE) )

head(DT_1)
str(DT_1)
head(DT_1$A)
head(DT_1[, A])   
head(DT_1[, 1])    

column_to_choose <- "A"
head(DT_1[, .SD, .SDcols = column_to_choose])               # Possibility 4

DT_2 <- DT_1[ C == TRUE & E %in% month.abb[1:6], ]       # Data subset
head(DT_2)    

DT_1[ C == TRUE & D %in% letters[1:10], summary(A + B)]  # Calculate summary statistics
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  -3.237   3.255   4.844   5.000   6.590  18.931

DT_1[ E %in% month.abb[1:6], list("mean_A" = mean(A), "sum_A" = sum(A)), by = E]

DT_1[ C == TRUE & D %in% letters[1:10] & E %in% month.abb[1:6], .N]
# [1] 12486

DT_3 <- data.table::copy(DT_1)                           # Replicate the data
DT_4 <- DT_3[ C == FALSE, "N" := .N, by = list(D, E)]
head(DT_4)

DT_5 <- DT_1[ , "mean_A" := mean(A), by = list(C, D, E)]
DT_5[ 1:100, plot(mean_A, B, pch = 20, col = "blue") ]


