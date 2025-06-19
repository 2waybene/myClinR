## https://bayer-group.github.io/sas2r/formatting.html

library(haven)

adsl <- read_xpt("https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/adsl.xpt")


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

head(my_table, n = 9)

library(dplyr)

my_table <- my_table %>%
  
  # remove repeating labels
  apply_row_masks(., row_breaks = TRUE) %>%
  
  # specify order of relevant variables
  select(row_label1, 
         row_label2,
         `var1_Xanomeline High Dose`,
         `var1_Xanomeline Low Dose`,
         var1_Placebo,
         var1_Total)  

library(flextable)

# a basic flextable
my_flextable <- my_table %>%
  
  # start flextable 
  flextable() %>%
  autofit()

my_flextable 

# a nicer flextable
my_flextable <- my_table %>%
  
  # start flextable 
  flextable() %>% 
  autofit() %>%
  
  # add some padding between rows
  padding(padding = 0.5) %>%
  
  # adjust width of first two columns
  width(j = 1:2, width = 4) %>%
  
  # align treatment columns to center
  align(part = "all", align = "center", j = 3:6) %>%
  
  # column header labels
  set_header_labels(., values = list(
    row_label1 = 'Variable',
    row_label2 = ' ',
    `var1_Xanomeline High Dose` = 'Xanomeline \nHigh Dose',
    `var1_Xanomeline Low Dose` = 'Xanomeline \nLow Dose',
    var1_Placebo = 'Placebo',
    var1_Total = 'Total')) %>%
  
  # header + footers
  add_header_lines(values = "Table: Demographics (Safety Analysis Set)") %>%
  add_footer_lines(values = "This was produced in R!") %>%
  
  # font size, font name
  fontsize(part = "all", size = 8)
# font()
# font(part = "all", fontname = "Times")  
# This errors, perhaps version issue.  -- SZ

setwd("../myClinR/BayerGroupRScripts/")

library(officer)

# send the flextable to .docx output
read_docx() %>%
  body_add_flextable(my_flextable) %>%
  print(target = "my_document.docx")
