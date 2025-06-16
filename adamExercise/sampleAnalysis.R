# Install sample data package

# Load libraries
library(pharmaverseadam)
library(dplyr)
library(survival)
library(ggplot2)



data(adsl)
head(adsl)


# Summary by treatment arm
adsl %>%
  group_by(TRT01A) %>%
  summarise(
    N = n(),
    AGE_MEAN = mean(AGE, na.rm = TRUE),
    SEX_DIST = paste0(table(SEX), collapse = "/")
  )

# Kaplan-Meier survival curve
adsl <- adsl %>%
  mutate(
    event = ifelse(EOSSTT == "COMPLETED", 0, 1),  # adjust based on flag meaning
    time = TRTDURD
  )

summary(adsl$TRT01A)


# Fit survival model
fit <- survfit(Surv(time, event) ~ TRT01A, data = adsl)

# Plot
plot(fit, col = 1:2, lty = 1:2, xlab = "Days", ylab = "Survival Probability")
legend("bottomleft", legend = levels(as.factor(adsl$TRT01A)), col = 1:2, lty = 1:2)

data("adae")

# Count of subjects with at least one AE per treatment
adae %>%
  distinct(USUBJID, TRTEMFL, TRT01A) %>%
  group_by(TRT01A) %>%
  summarise(AE_subjects = n())

# Example: plot change from baseline in ALT by treatment
data("adlb")

adlb %>%
  filter(PARAMCD == "ALT") %>%
  ggplot(aes(x = TRT01A, y = CHG)) +
  geom_boxplot() +
  labs(title = "ALT Change from Baseline by Treatment", y = "Change (U/L)", x = "Treatment")






