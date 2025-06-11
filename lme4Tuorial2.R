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


str(cake)
## 'temp' is continuous, 'temperature' an ordered factor with 6 levels
(fm1 <- lmer(angle ~ recipe * temperature + (1|recipe:replicate), cake, REML= FALSE))
(fm2 <- lmer(angle ~ recipe + temperature + (1|recipe:replicate), cake, REML= FALSE))
(fm3 <- lmer(angle ~ recipe + temp + (1|recipe:replicate), cake, REML= FALSE))

anova(fm3, fm2, fm1)


require(lattice)
str(Dyestuff)
dotplot(reorder(Batch, Yield) ~ Yield, Dyestuff,
        ylab = "Batch", jitter.y = TRUE, aspect = 0.3,
        type = c("p", "a"))
dotplot(reorder(Batch, Yield) ~ Yield, Dyestuff2,
        ylab = "Batch", jitter.y = TRUE, aspect = 0.3,
        type = c("p", "a"))
(fm1 <- lmer(Yield ~ 1|Batch, Dyestuff, REML = FALSE))
(fm2 <- lmer(Yield ~ 1|Batch, Dyestuff2, REML = FALSE))


anova(fm2, fm1)

