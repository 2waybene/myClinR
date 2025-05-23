##  file: lme4Tutorial1.R
##  credit: https://www.rensvandeschoot.com/tutorials/lme4/

library(lme4) # for the analysis
library(haven) # to load the SPSS .sav file
library(tidyverse) # needed for data manipulation.
library(RColorBrewer) # needed for some extra colours in one of the graphs
library(lmerTest)# to get p-value estimations that are not part of the standard lme4 packages

popular2data <- read_sav(file ="https://github.com/MirjamMoerbeek/Data_Sets_ML_book/tree/main/Nurses.sav")


# Define file paths for the downloaded SPSS files
file1 <- "popular2.sav"  # Replace with the path if you downloaded locally

# Download the SPSS files (if not already done)
download.file("https://github.com/MirjamMoerbeek/Data_Sets_ML_book/tree/main/Nurses.sav", file1, mode = "wb")

# Read the SPSS files with user_na = TRUE
df1 <- read_sav(file1, user_na = TRUE)

df2 <- read_sav("/Users/jyli/Downloads/sample.sav", user_na = TRUE)
