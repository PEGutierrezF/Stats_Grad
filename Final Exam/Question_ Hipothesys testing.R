

The National Atmospheric Deposition Program (NADP) has been measuring pollutants 
in air and precipitation for several decades in Burlington and on the slopes of Mt. 
Mansfield at the Proctor Maple Research Center. 

Let s explore this large data set of atmospheric levels of  SO4 (dry deposition) 
from the Burlington site  and identify an upper threshold beyond which health officials 
should sound an air quality "alarm." 

The mean from this sample of over the 2 decades of air quality measurements is 2.75 
and the standard deviation is 0.09

Imagine that air quality managers would like to sound an "air quality alert" for 
any days where measurements  fall in the top 10% of probable values from this sample. 
 
What measured SO4  concentration value threshold should be used to sound this top 
10% "air quality alert "?
To put this another way, report the actual SO4 value beyond which there is only a 
10% probability of measurements being recorded.
Report your answer to 2 decimal places.

# Given data
mean_SO4 <- 2.75
sd_SO4 <- 0.09

# Z-score corresponding to the top 10% probability
z_score <- qnorm(0.9)

# Calculate the threshold value
threshold <- (z_score * sd_SO4) + mean_SO4

# Round to 2 decimal places
threshold <- round(threshold, 2)

# Print the result
print(paste("SO4 concentration value threshold:", threshold))
