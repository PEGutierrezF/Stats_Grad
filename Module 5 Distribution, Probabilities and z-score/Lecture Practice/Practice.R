
Every distribution has four (two in this example) associated functions whose prefix 
indicates the type of function and the suffix indicates the 
distribution. 
pnorm: cumulative density function of the normal distribution
qnorm: quantile function of the normal distribution


This function returns the value of the cumulative density function (cdf) 
of the normal distribution given a certain random variable q, 
a population mean ??, and the population standard deviation ??.

We use the R function 'pnorm' to convert from z-scores to areas (areas under the curve) 
and 'qnorm' to convert from areas (areas under the curve) to z-scores.


Example: In this example, we will be calculating the percentage of students 
at this school who are taller than 75 inches height of males at a certain 
school is normally distributed with a mean of ??=70 inches and a standard 
deviation of ?? =3 inches using the pnorm() function in the R.

pnorm(75, mean=70, sd=3, lower.tail=FALSE) 

Example: Suppose you know that a population of test scores has a mean of 70 and a
standard deviation of 10. What proportion of scores fall above 80?

pnorm(80, mean = 70, sd = 10, lower.tail = FALSE)

# Load necessary libraries
library(ggplot2)

# Given values
mean_score <- 70
sd_score <- 10
x_value <- 80

# Create a sequence of x values for the plot (a wide enough range)
x_vals <- seq(mean_score - 4*sd_score, mean_score + 4*sd_score, length.out = 1000)

# Create the normal density for the x values
y_vals <- dnorm(x_vals, mean = mean_score, sd = sd_score)

# Create a data frame for plotting
data <- data.frame(x = x_vals, y = y_vals)

# Calculate the proportion of scores above 80
proportion_above_80 <- pnorm(80, mean = 70, sd = 10, lower.tail = FALSE)

# Create the plot
ggplot(data, aes(x, y)) +
  geom_line(size = 1, color = "blue") +  # Plot the normal distribution curve
  geom_area(data = subset(data, x >= x_value), aes(y = y), fill = "red", alpha = 0.5) +  # Shade the area above 80
  geom_vline(xintercept = x_value, linetype = "dashed", color = "black", size = 1) +  # Mark the value 80
  labs(title = "Normal Distribution with Mean = 70, SD = 10", 
       subtitle = paste("Proportion of Scores Above 80: ", round(proportion_above_80, 4)),
       x = "Test Scores", 
       y = "Density") +
  theme_minimal()



# qnorm -------------------------------------------------------------------

This function returns the value of the inverse cumulative density function (cdf) 
of the normal distribution given a certain random variable p, a population 
mean ??, and the population standard deviation ??.

In this example, we are calculating the Z-score of the 95th quantile of the 
standard normal distribution using the qnorm() function in R.

qnorm(.95, mean=0, sd=1)




