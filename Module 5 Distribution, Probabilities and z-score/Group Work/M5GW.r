### Descriptive Stats Wednesday Module 5 Demonstration ###
### NR 2990 
### Fall 2023

################################################################
### Where there is XXX you will need to add in your own code! ##
################################################################


#and make sure our libraries are loaded:
library(tidyverse)
library(lessR)
library(readxl)

#Import our data
depression_data <- read_xlsx("Depression_Internet.xlsx")

#Reminder: you can hit "Tab" to see what options are available and for autocomplete)
depression_data |> 
  mutate(DepressionDifference = DepressionAfter - DepressionBefore)

#So why does that not work? Take a look at the 'type' of each column. 
#See how it says <chr>? for both of our Depression Columns? 
#We need it to be numbers, which is called type <dbl>.             

depression_data_num <- depression_data |> 
  mutate_at(c('DepressionAfter', 'DepressionBefore'), as.numeric) 

#This makes a NEW dataset with our new column, so use this going forward
depression_data_diff <- depression_data_num |> 
  mutate(DepressionDifference = DepressionAfter - DepressionBefore)



#What does mutate do?

#Question 1
#What is our data, and what column are we interested in?
ggplot(data = XXX, mapping = aes(x = XXX)) + geom_density()

ggplot()

#Question 2
pivot(depression_data_diff, c(IQR, skew, kurtosis, mean, sd, var), DepressionDifference)

#Question 3, normality test
shapiro.test(depression_data_diff$DepressionDifference)

#less than p=0.05, assume not normal - why?


#Question 4, z-scores
#remember our formula
#z_score <- (value-mean)/sd

# What is the probability of seeing a person in the general population with an increase of
# more than 1 depression unit (i.e. measured value (X) for your difference column is p(X>1).
                             
z <- (1-(-0.11))/0.553
probability <- 1-pnorm(z)
probability

# If we wanted to flag people whose depression increased significantly (using a 1-tailed 0.05 alpha
# threshold) what is the depression value we would use as the threshold to flag people for
# additional follow-up?
threshold_z <- qnorm(0.95)
threshold_value <- -0.118 + (threshold_z * 0.553)



