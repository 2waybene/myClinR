# Install sample data package

# Load libraries
library(pharmaverseadam)
library(dplyr)
library(survival)
library(ggplot2)



data(adsl)
head(adsl)
str(adsl)

colnames(adsl)
# Summary by treatment arm
adsl %>%
  group_by(TRT01A) %>%
  summarise(
    N = n(),
    AGE_MEAN = mean(AGE, na.rm = TRUE),
    SEX_DIST = paste0(table(SEX), collapse = "/")
  )

paste0(table(adsl$SEX), collapse="/")
mean(adsl$AGE, na.rm = TRUE)
adsl %>% summarise(n())


# Kaplan-Meier survival curve
adsl <- adsl %>%
  mutate(
    event = ifelse(EOSSTT == "COMPLETED", 0, 1),  # adjust based on flag meaning
    time = TRTDURD
  )

summary(adsl$TRT01A)
dim(adsl)

table(adsl$EOSSTT)
e = ifelse(adsl$EOSSTT == "COMPLETED", 0, 1)

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



# Simulate baseline and follow-up efficacy score
set.seed(123)  # for reproducibility
efficacy_df <- adsl %>%
  filter(SAFFL == "Y", TRT01A %in% c("Placebo", "Xanomeline High Dose")) %>%
  mutate(
    BASE = round(rnorm(n(), mean = 50, sd = 10), 1),
    CHG = ifelse(TRT01A == "Placebo",
                 round(rnorm(n(), mean = -1, sd = 5), 1),
                 round(rnorm(n(), mean = -5, sd = 5), 1)),
    AVAL = BASE + CHG
  ) %>%
  select(USUBJID, TRT01A, BASE, CHG, AVAL)

head(efficacy_df)

efficacy_df %>%
  group_by(TRT01A) %>%
  summarise(
    N = n(),
    Mean_BASE = mean(BASE),
    Mean_CHG = mean(CHG),
    SD_CHG = sd(CHG)
  )

t_test <- t.test(CHG ~ TRT01A, data = efficacy_df)
tidy(t_test)

ggplot(efficacy_df, aes(x = TRT01A, y = CHG, fill = TRT01A)) +
  geom_boxplot() +
  labs(
    title = "Simulated Efficacy Change from Baseline",
    x = "Treatment Arm", y = "Change from Baseline"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

model <- lm(CHG ~ TRT01A + BASE, data = efficacy_df)
summary(model)




