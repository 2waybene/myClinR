library(haven)
# test summary of subject level dataset
adsl <- read_xpt(
  file="http://phuse-scripts.googlecode.com/svn/trunk/lang/R/report/test/data/adsl.xpt")
summary(adsl)

adam_path <- "https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/"
adsl <- haven::read_xpt(paste0(adam_path, "adsl.xpt"))


adsl <- haven::read_xpt("http://phuse-scripts.googlecode.com/svn/trunk/lang/R/report/test/data/adsl.xpt")

##=================================
##  None of the following work
##=================================


# adsl <- haven::read_xpt("https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/adsl.xpt")
# adsl <- haven::read_xpt("https://github.com/mtandp/TestDataFactory/tree/master/Updated/TDF_AdaM/adsl.xpt")


mcsl <- read.table(
  file="http://phuse-scripts.googlecode.com/svn/trunk/lang/R/report/test/data/mcsl.csv",
  header=TRUE,
  sep=",")
summary(mcsl)