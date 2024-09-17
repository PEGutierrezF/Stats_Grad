### Descriptive Stats Wednesday Demonstration ###
### NR 5990B 
### Fall 2024

#installing lessR
install.packages("lessR")
install.packages("tidyverse")

#loading in the libraries we will use
library(tidyverse)
library(lessR)

#open up our data
fish <- read_csv('~/Desktop/NR2990/fish_data.csv')

fish <- read.csv('fish_data.csv')

View(fish)

#pivot gives us more summary statistics. 
pivot(fish, c(IQR, skew, kurtosis, mean, sd, var), Length)


?c

# Fish is our data frame and Length is the column
quantiles <- quantile(fish$Length, probs = c(0.25, 0.75))
# Display the results
quantiles


# Plots -------------------------------------------------------------------
#density plot - does it look normal?
ggplot(data = fish, mapping = aes(x = Length)) + geom_density()


#Violin plots using lessR plotting
Plot(Weight, data = fish, by1=Species)

#Violin plots using ggplot (part of tidyverse) plotting
ggplot(data = fish, mapping = aes(x = Length, y = Species)) + geom_violin(aes(fill = factor(Species)))

#boxplots!
ggplot(data = fish, mapping = aes(x = Length, y = Species)) + geom_boxplot(aes(fill = factor(Species)))


#http://www.sthda.com/english/wiki/ggplot2-density-plot-quick-start-guide-r-software-and-data-visualization
ggplot(fish, aes(x=Weight, color=Species)) + geom_density()


#how to test for normality! 
#http://www.sthda.com/english/wiki/normality-test-in-r

shapiro.test(fish) #what is wrong here?

shapiro.test(fish$Weight) #so what does this mean?

?shapiro.test

#From the output, the p-value > 0.05 implying that the distribution of the data are
#significantly different from normal distribution. In other words, the data appears not normal.

#skew and kurtosis, a different way
?skew

ggplot(fish, aes(x=Length, fill=Species, color=Species)) +  geom_histogram()
skew(fish$Length)

kurtosis(fish$Length)



