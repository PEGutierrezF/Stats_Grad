#### Multiple Linear Regression ####
#### NR2400 ####
#### Oxygen and Fitness ####
install.packages("relaimpo")
library(relaimpo)

#Step 1: Import Data. You'll want to look at it to see the variables you have.
oxygen <- read_csv("Fitness_and_Oxygen.csv")

#Step 2: Making your basic your model
#Use the "." which will include ALL of the variables
base_model <- lm(Oxy ~ ., data = oxygen)

#Step 3: Refining your model with stepwise regression
#This goes through and chooses which variables to keep
final_model <- stepAIC(base_model, direction="both")
final_model$anova # display results

#Step 4: Make sure your Variances aren't inflated (should be below 10)
#This only gives a result if there are multiple variables
vif(final_model)

#Step 5: Now, lets look at what our model says!
#Here is where most of the work is, pulling out the terms of interest
summary(final_model)

#Step 6 Relative Importances - which variables contribute the most?
calc.relimp(final_model,type=c("lmg"))
plot(calc.relimp(final_model,type=c("lmg")))


#Cook's D'
ggplot(as_tibble(cooks.distance(final_model)), aes(value)) + geom_boxplot()
plot(final_model,which=4)
# # Identify outliers based on Cook's distance ----------------------------
# Calculate Cook's distance
cooksd <- cooks.distance(final_model)
# Replace 'df' with the name of your data.
outliers <- cooksd > 4/nrow(df)  # Using a threshold of 4/n
outliers
#Are there any outliers?


#Check the residuals for normality
ggplot(final_model, aes(final_model$residuals)) + geom_density()
shapiro.test(final_model$residuals)


press <- resid(final_model)/(1 - lm.influence(final_model)$hat)
PRESS <- sum(press^2)
PRESS

# PRESS_RMSE
PRESS_RMSE <- sqrt(PRESS/length(final_model$residuals))
PRESS_RMSE

