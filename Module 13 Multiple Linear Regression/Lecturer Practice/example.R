

data <- read.csv('heart.data.csv')
tail(data, 3)

# Build the model
mod <- lm(heart.disease ~ biking + smoking, data = data)
summary(mod)

library(MASS)
model_equation(mod, digits = 3, trim = TRUE)

# Equation
heart disease = 14.98 + (-0.2*biking) + (0.178*smoking) ± e

install.packages('equatiomatic')
library(equatiomatic)
extract_eq(mod,
           use_coefs = TRUE, # display coefficients
           wrap = TRUE, # multiple lines
           terms_per_line = 2
)


# Data visualization
par(mfrow = c(1, 2))  
# Plot heart.disease vs. biking
plot(data$biking, data$heart.disease, 
     pch = 16, col = "blue", 
     xlab = "Biking", ylab = "Heart Disease", 
     main = "Heart Disease vs. Biking")
abline(lm(heart.disease ~ biking, data = data), col = "red", lwd = 2)

# Plot heart.disease vs. smoking
plot(data$smoking, data$heart.disease, 
     pch = 16, col = "blue", 
     xlab = "Smoking", ylab = "Heart Disease", 
     main = "Heart Disease vs. Smoking")
abline(lm(heart.disease ~ smoking, data = data), col = "red", lwd = 2)


library(visreg)
par(mfrow = c(1, 2)) 
visreg(mod)

# Assumptions -------------------------------------------------------------
# 1. Normality of Residuals
shapiro.test(residuals(mod))

# Q-Q Plot
qqnorm(residuals(mod))
qqline(residuals(mod), col = "red", lwd = 2)

# 2. Homoscedasticity
# The variance of residuals should be constant across fitted values.
library(lmtest)
bptest(mod)

# Residuals vs. Fitted again for homoscedasticity
plot(mod$fitted.values, residuals(mod), 
     xlab = "Fitted Values", ylab = "Residuals", 
     main = "Check for Homoscedasticity")
abline(h = 0, col = "red", lwd = 2)



# 3. Multicollinearity
Predictors should not be too highly correlated with each other.
Calculate Variance Inflation Factor (VIF) using the car package.
library(car)
vif(mod)

#create vector of VIF values
vif_values <- vif(mod)
#create horizontal bar chart to display each VIF value
barplot(vif_values, main = "VIF Values", horiz = TRUE, col = "steelblue")
#add vertical line at 5
abline(v = 0.5, lwd = 3, lty = 2)

