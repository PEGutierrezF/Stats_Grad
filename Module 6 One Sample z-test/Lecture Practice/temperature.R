




#loading in the libraries we will use
library(tidyverse)
library(lessR)
library(readxl)
library(BSDA)


#open data
climate_data <- read_xlsx("Lecture Practice/Global Climate Anomalies.xlsx", sheet="fall_2024")

# Population 
mean(filter(climate_data, era=="Historical")$Annual_Anom_J_D)
sd(filter(climate_data, era=="Historical")$Annual_Anom_J_D)


anthropocene <- filter(climate_data, era=="Anthropocene")$Annual_Anom_J_D

z.test(x=anthropocene,
       mu=-18.52475,
       alternative = "greater",
       sigma.x = 21.09767)



Historical <- filter(climate_data, era=="Historical")$Annual_Anom_J_D

mean(filter(climate_data, era=="Base Population")$Annual_Anom_J_D)
sd(filter(climate_data, era=="Base Population")$Annual_Anom_J_D)


z.test(x=Historical,
       mu=53.8,
       alternative = "two.sided",
       sigma.x = 22.63869)



# visulaization -----------------------------------------------------------

# Required libraries
library(ggplot2)
library(dplyr)

# Perform z-test for Historical data
Historical <- filter(climate_data, era == "Historical")$Annual_Anom_J_D
mu_0 <- 53.8
sigma_0 <- 22.63869
n <- length(Historical)
sample_mean <- mean(Historical)

# Calculate z-test statistic
z_score <- (sample_mean - mu_0) / (sigma_0 / sqrt(n))

# Create a data frame for the standard normal distribution
x_vals <- seq(-4, 4, length = 1000)
y_vals <- dnorm(x_vals)

# Plotting the normal distribution with critical regions and z-score
ggplot(data = data.frame(x = x_vals, y = y_vals), aes(x = x, y = y)) +
  geom_line(color = "blue") +
  
  # Shade critical regions
  geom_area(data = subset(data.frame(x = x_vals, y = y_vals), x < -1.96), aes(x = x, y = y), fill = "red", alpha = 0.3) +
  geom_area(data = subset(data.frame(x = x_vals, y = y_vals), x > 1.96), aes(x = x, y = y), fill = "red", alpha = 0.3) +
  
  # Mark the calculated z-score on the plot
  geom_vline(xintercept = z_score, color = "darkgreen", linetype = "dashed", size = 1) +
  
  # Add labels
  labs(title = "Z-Test: Historical Data",
       subtitle = paste("Z-Score =", round(z_score, 2)),
       x = "Z Value",
       y = "Density") +
  
  # Annotate the z-score location
  annotate("text", x = z_score, y = 0.1, label = paste("Z =", round(z_score, 2)), color = "darkgreen", vjust = -1) +
  
  # Customize theme
  theme_minimal()
