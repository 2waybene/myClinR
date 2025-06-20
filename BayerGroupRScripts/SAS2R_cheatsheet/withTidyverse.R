library (datasets)
library(gapminder)
library(tidyverse)

##========================
##  prepare old data
##========================

old_data <- as.data.frame (
  list("job_title"= sample(c("Programmer", "Manager", "Director", "VP"), 100, replace = TRUE),
       "id"=seq(1:100)))

old_data <- old_data %>% mutate (Sex = sample(c("F", "M"), 100, replace=TRUE))
old_data <- old_data %>% mutate (temp = sample (c(5, 10, 15, 20, 25, 30, 25), 100, replace = TRUE))
old_data <- old_data %>% mutate (year = sample (c(2000 + c(1:25)), 100, replace=TRUE))

##========================================================================
# Example: Sample 10 birth dates between 1980-01-01 and 2020-12-31
start_date <- as.Date("1980-01-01")
end_date <- as.Date("2020-12-31")
all_dates <- seq(from = start_date, to = end_date, by = "day")
random_birth_dates <- sample(all_dates, size = 10, replace = TRUE) # Sample with replacement
print(random_birth_dates)
old_data <- old_data %>% mutate (dob = sample(all_dates, size = 100, replace = TRUE))


old_data <-  old_data %>% mutate (old_name = paste(temp, Sex, sep=":"))
old_data <- old_data %>% mutate (hours = sample(c(25, 30, 36, 40), 100, replace=TRUE))
old_data <- old_data %>% mutate (wages = sample(seq(35000, 90000, by = 500) , 100, replace=TRUE))
old_data <- old_data %>% mutate (benefits = sample(seq(5000, 20000, by = 500) , 100, replace=TRUE))

                                               


head(old_data)
##========================================
## Datasets; drop, keep & rename variables
##=========================================
new_data <- old_data
new_data <- old_data %>% 
  select(-job_title) %>% 
  select(id)
 
new_data <- old_data %>% 
  select(-starts_with("temp"))

new_data <- old_data %>% 
  rename(new_name = old_name)

##========================================
## Conditional filtering
##=========================================

new_data <- old_data %>% 
  filter(Sex == "M")

new_data <- old_data %>%
  filter(year %in%
           c(2010,2011,2012))

new_data <- old_data %>%
  group_by( id ) %>%
  slice(1)

##========================================
## New variables, conditional editing
##=========================================
new_data <- old_data %>% 
  mutate(total_income = wages + benefits)

new_data <- old_data %>% 
  mutate (full_time = if_else (hours > 30, "Y", "N"))

new_data <- old_data %>% 
  mutate(weather=case_when(
    temp > 20 ~ "Warm", 
    temp > 10 ~ "Mild", 
    TRUE ~ "Cold"))

head(new_data)

##========================================
## Counting and Summarising
##=========================================

old_data %>% 
  count(job_title) %>% mutate(pcnt = n*100/sum(n))

old_data %>% 
  count(job_title, Sex)

new_data <- old_data %>% 
  group_by(job_title, Sex) %>% 
  summarise(Count=n())

new_data <- old_data %>%
  group_by(job_title, Sex) %>%
  summarise( total_salaries = sum( wages ),
             Count = n( ))

##========================================
## Combining datasets
##=========================================

data1 <- slice_sample(old_data, prop=0.2)
data2 <- slice_sample(old_data, prop=0.3)

new_data <- bind_rows( data1, data2 )

new_data <- left_join( data1, data2 , by = "id")

