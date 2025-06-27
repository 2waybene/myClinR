## Credit: https://cran.r-project.org/web/packages/Tplyr/vignettes/Tplyr.html
#library(haven)
library(Tplyr)
library(knitr)
#library(dplyr)
#library(tidyverse)

#adsl <- read_xpt("https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/adsl.xpt")


t <- tplyr_table(tplyr_adsl, TRT01P, where = SAFFL == "Y")
t
#> *** tplyr_table ***
#> Target (data.frame):
#>  Name:  tplyr_adsl
#>  Rows:  254
#>  Columns:  49 
#> treat_var variable (quosure)
#>  TRT01P
#> header_n:  header groups
#> treat_grps groupings (list)
#> Table Columns (cols):
#> where: == SAFFL Y
#> Number of layer(s): 0
#> layer_output: 0

cnt <- group_count(t, AGEGR1)
cnt
#> *** count_layer ***
#> Self:  count_layer < 0x55ceee294e08 >
#> Parent:  tplyr_table < 0x55ceed1d40d8 >
#> target_var: 
#>  AGEGR1
#> by: 
#> where: TRUE
#> Layer(s): 0
dsc <- group_desc(t, AGE)
dsc
#> *** desc_layer ***
#> Self:  desc_layer < 0x55ceee448e50 >
#> Parent:  tplyr_table < 0x55ceed1d40d8 >
#> target_var: 
#>  AGE
#> by: 
#> where: TRUE
#> Layer(s): 0

shf <- group_shift(t, vars(row=COMP8FL, column=COMP24FL))
shf
#> *** shift_layer ***
#> Self:  shift_layer < 0x55ceee680808 >
#> Parent:  tplyr_table < 0x55ceed1d40d8 >
#> target_var: 
#>  COMP8FL
#>  COMP24FL
#> by: 
#> where: TRUE
#> Layer(s): 0
#> 
#> 


t <- tplyr_table(tplyr_adsl, TRT01P) %>% 
  add_layer(
    group_count(AGEGR1, by = "Age categories n (%)")
  )

t <- tplyr_table(tplyr_adsl, TRT01P) %>% 
  add_layer(
    group_count(AGEGR1, by = "Age categories n (%)") %>% 
      set_format_strings(f_str("xx (xx.x%)", n, pct)) %>% 
      add_total_row()
  )

t <- tplyr_table(tplyr_adsl, TRT01P) 

l1 <- group_count(t, AGEGR1, by = "Age categories n (%)")
l2 <- group_desc(t, AGE, by = "Age (years)")

t <- add_layers(t, l1, l2)

t

t <- tplyr_table(tplyr_adsl, TRT01P) %>% 
  add_layer(
    group_count(AGEGR1, by = "Age categories n (%)")
  )

t %>% 
  build() %>% 
  kable()

get_numeric_data(t) %>% 
  head() %>% sort_by("summary_var") %>% 
  kable() 

tplyr_table(tplyr_adae, TRTA) %>% 
  add_layer(
    group_count('Subjects with at least one adverse event') %>% 
      set_distinct_by(USUBJID) %>% 
      set_format_strings(f_str('xx', n))
  ) %>% 
  build() %>% 
  kable()

t <- tplyr_table(tplyr_adsl, TRT01P) %>% 
  add_layer(
    group_desc(AGE, by = "Age (years)") %>% 
      set_format_strings(
        'n' = f_str('xx', n),
        'Mean (SD)' = f_str('xx.xx (xx.xxx)', mean, sd)
      )
  )
t %>% 
  build() %>% 
  kable()


tplyr_table(tplyr_adsl, TRT01P, where= SAFFL =="Y", cols = vars(SEX, RACE)) %>% 
  add_layer(
    group_desc(AGE, by = "Age (Years)")
  ) %>% 
  build() %>% 
  kable()