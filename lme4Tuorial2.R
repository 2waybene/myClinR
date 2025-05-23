# Load the lme4 package
library(lme4)

# Sample data (replace with your own)
data <- data.frame(
  score = rnorm(100, mean = 70, sd = 10),
  method = sample(c("A", "B"), 100, replace = TRUE),
  classroom = sample(1:10, 100, replace = TRUE)
)

# Fit the mixed model
model <- lmer(score ~ method + (1|classroom), data = data)

# Summarize the model
summary(model)

# Extract fixed effects
fixef(model)

# Extract random effects
ranef(model)


str(sleepstudy)


fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)


RShowDoc("lmerperf", package = "lme4") 

