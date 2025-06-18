
# Install haven if needed
# install.packages("haven")
library(haven)

# Example: Load ADSL ADaM dataset from PHUSE
adsl <- read_xpt("https://raw.githubusercontent.com/phuse-org/phuse-scripts/master/data/adam/cdisc/adsl.xpt")
head(adsl)

# Simulate an efficacy continuous endpoint
set.seed(456)
eff_df <- adsl %>%
  filter(SAFFL == "Y", TRT01A %in% c("Placebo", "Xanomeline High Dose")) %>%
  mutate(
    BASE = round(rnorm(n(), 50, 10), 1),
    CHG  = ifelse(TRT01A=="Placebo",
                  round(rnorm(n(), -1, 5),1),
                  round(rnorm(n(), -5, 5),1))
  )

# Mixed analytics
eff_df %>%
  group_by(TRT01A) %>%
  summarise(N=n(), mean_chg=mean(CHG), sd_chg=sd(CHG))

ttest <- t.test(CHG ~ TRT01A, data=eff_df)
tidy(ttest)

ggplot(eff_df, aes(TRT01A, CHG, fill=TRT01A)) +
  geom_boxplot() + theme_minimal() + theme(legend.position="none")


# install.packages("safetyData")
library(safetyData)

# List available ADaM datasets
ls("package:safetyData", pattern = "^adam_")

# Load an example, e.g., lab results or adverse events
head(safetyData::adam_adae)

