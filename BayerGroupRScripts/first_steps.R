## Data
## https://github.com/Bayer-Group/sas2r/tree/main

library(tidyverse)
adam_path <- "https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/"
adsl <- haven::read_xpt(paste0(adam_path, "adsl.xpt"))

# Select a few variables
adsl <- adsl %>%
  dplyr::select(STUDYID, USUBJID, SUBJID, AGE, TRT01A, TRT01P, TRTSDT, TRTEDT, RACE, SEX, DISCONFL)

str(adsl)

adsl %>%
  group_by(TRT01A) %>%
  summarise(
    N = n(),
    AGE_MEAN = mean(AGE, na.rm = TRUE),
    SEX_DIST = paste0(table(SEX), collapse = "/")
  )

table(adsl$SEX)

adsl %>%
  count(SEX)

#for multiple variables
table(adsl$SEX, adsl$TRT01P, adsl$RACE) 

adsl %>%
  count(SEX, TRT01P, RACE)

# to keep (only) SUBJID
adsl %>%
  select(SUBJID) %>%
  head() # keep only first 6 rows

# to keep all variables except SUBJID
adsl %>%
  select(-SUBJID) %>%
  head()

adsl %>%
  filter(SEX == "F") %>%
  head() 

# multiple conditions:
adsl %>%
  filter(SEX == "F" & AGE > 70) %>%
  head() 

# ascending
adsl %>%
  arrange(AGE)%>%
  head() 

# descending
adsl %>%
  arrange(-AGE)%>%
  head() 

adsl %>%
  mutate(AGEGR1 = case_when(
    AGE > 50 ~"> 50 years old",
    AGE <= 50 ~"<= 50 years old",
  )) %>%
  head()

# is.na to check if it's missing
c(" ", "Y", NA_character_) %>% is.na()

# NA is non-comparable, result in NA
c(" ", "Y", NA_character_) != "Y"

# add one more row to the data with missing AGE and DISCONFL, select the first 3 rows
adsl_na_example <- adsl %>% 
  add_row(SUBJID = "1", DISCONFL = NA_character_, .before = T) %>% 
  slice(1:3) %>% 
  select(SUBJID, DISCONFL)
# demo data
adsl_na_example

adsl_na_example %>% filter(DISCONFL != "Y")

# include is.na(DISCONFL) in the filter
adsl_na_example %>% filter(DISCONFL != "Y" | is.na(DISCONFL))

# add one more row to the data with missing AGE and DISCONFL 
# select the first 3 rows
adsl_na_sort <- adsl %>% 
  add_row(SUBJID = "1", AGE = NA_integer_, .before = T) %>% 
  slice(1:5) %>% 
  select(SUBJID, AGE)

# ascending
adsl_na_sort %>%
  arrange(AGE)

# to be consistent with SAS - NA at the top when ascending
adsl_na_sort %>%
  arrange(!is.na(AGE), AGE)

adsl_na_sort %>%
  mutate(AGEGR1 = case_when(
    AGE > 50 ~"> 50 years old",
    AGE <= 50 ~"<= 50 years old",
  )) 

SUBJID <- sample(adsl$SUBJID, 100, replace = FALSE)
WEIGHT <- sample(50:100, 100, replace = TRUE)

adsl_weight <- data.frame(SUBJID, WEIGHT)

# inner join
adsl%>%
  inner_join(adsl_weight, by = "SUBJID") 

# outer join
adsl %>%
  full_join(adsl_weight, by = "SUBJID")

# left join
adsl %>%
  left_join(adsl_weight, by = "SUBJID")

# first 5 records of adsl
adsl_1 <- adsl[c(1:5),]

# the next 5 records of adsl
adsl_2 <- adsl[c(6:10),]

# tidyverse method - bind_rows()
adsl_stacked <- adsl_1 %>%
  bind_rows(adsl_2) 















