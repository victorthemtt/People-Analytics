install.packages('plm')

library('plm')

data <- read.csv('performance_2014t2016.csv')


# Run a fixed effects model
model_fe <- plm(perf_l1 ~ 
                  procjust_l1+valuefit_l1+sickdays_l1+jobsat_l1+distjust_l1+jobstrain_l1+training_l1, data = data, model = "within")

model_re <- plm(perf_l1 ~ 
                  procjust_l1+valuefit_l1+sickdays_l1+jobsat_l1+distjust_l1+jobstrain_l1+training_l1, data = data, model = "random")

summary(model_fe)
summary(model_re)


# You might want to compare these models or choose based on a Hausman test
test_hausman <- phtest(model_fe, model_re)
print(test_hausman)








###########
# A more comprehensive approach: 

# Install and load necessary packages
if (!require("plm")) install.packages("plm", dependencies=TRUE)
library(plm)

if (!require("dplyr")) install.packages("dplyr", dependencies=TRUE)
library(dplyr)

if (!require("ggplot2")) install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

# Data loading
data <- read.csv('performance_2014t2016.csv')

# Data preprocessing
# Checking for missing values and removing or imputing them
data <- na.omit(data)

# Exploratory Data Analysis (EDA)
# Summary statistics
summary(data)

# Visualizing relationships between variables
ggplot(data, aes(x = jobsat_l1, y = perf_l1)) + 
  geom_point() + 
  geom_smooth(method = 'lm') + 
  labs(title = "Job Satisfaction vs. Performance", x = "Job Satisfaction", y = "Performance")

# Correlation matrix plot
correlations <- cor(data[sapply(data, is.numeric)])
library(corrplot)
corrplot(correlations, method = "circle")

# Model Building
# Fixed Effects Model
model_fe <- plm(perf_l1 ~ procjust_l1 + valuefit_l1 + sickdays_l1 + jobsat_l1 + distjust_l1 + jobstrain_l1 + training_l1, 
                data = data, model = "within")

# Random Effects Model
model_re <- plm(perf_l1 ~ procjust_l1 + valuefit_l1 + sickdays_l1 + jobsat_l1 + distjust_l1 + jobstrain_l1 + training_l1, 
                data = data, model = "random")

# Model Comparison
# Summary of models
summary(model_fe)
summary(model_re)

# Hausman Test for model selection
test_hausman <- phtest(model_fe, model_re)
print(test_hausman)

# Model Diagnostics
# Checking for multicollinearity
library(car)
vif(model_fe)
vif(model_re)

# Residual diagnostics for fixed effects model
plot(residuals(model_fe), type = "l", main = "Residual Plot for Fixed Effects Model")

# Saving the output
write.csv(summary(model_fe), "fixed_effects_model_summary.csv")
write.csv(summary(model_re), "random_effects_model_summary.csv")


