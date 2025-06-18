## https://github.com/phuse-org/TestDataFactory/tree/main/Updated/TDF_ADaM


library(help = "datasets")


# ToothGrowth looks interesting
data(ToothGrowth)

library(haven)

adsl <- read_xpt("https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/adsl.xpt")
adae <- read_xpt("https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/adae.xpt")

library(Tplyr)

options(
  # Categorical variable defaults
  tplyr.count_layer_default_formats =
    list(n_counts = f_str("xxx [xx.xx%]", n, pct)),
  
  # Continuous variable defaults
  tplyr.desc_layer_default_formats =
    list('N'         = f_str('xx', n),
         'Mean [SD]' = f_str('xx.xx [xx.xxx]', mean, sd),
         'Median'    = f_str('xx.x', median),
         'Min, Max'  = f_str('xx, xx', min, max))
)

library(dplyr)

# Initiate Tplyr, specify treatment variable, optional where condition
my_table <-  tplyr_table(adsl, TRT01P, where = SAFFL == "Y") %>%
  
  # Add a total group column
  add_total_group() %>%
  
  # Add individual variables here
  add_layer(group_desc(AGE, b = "Age (years)")) %>%
  add_layer(group_count(AGEGR1, b = "Age Group 1 (years)")) %>%
  add_layer(group_count(SEX, b = "Gender")) %>%
  add_layer(group_count(ETHNIC, b = "Ethnicity")) %>%
  add_layer(group_desc(BMIBL, b = "Baseline Body Mass Index (kg/m2)")) %>%
  
  # Build
  build()

str(my_table)
