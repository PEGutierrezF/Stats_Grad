# Wilcoxon Practice #
# NR2990 #
# This is the standard practice outline we'll follow for the tests as we move through the semester.
# You can add your code to the outline after each comment, then scroll to the bottom to see how we did it:

#Here is the question: 
#Do these two populations of squid have the same or different number of fish in their stomachs?

#1. Import libraries and load packages

#2. Import your data

#3. Run descriptive statistics

#4.Visualize your distribution

#5. Visualize the sample means and standard deviations

#6. Test for normality and other assumptions (equal variance) (mental check for paired or not)

#7. Run the code for the appropriate test















#1. Import libraries and load packages

library(tidyverse)
library(lessR)
library(readxl)
library(BSDA)
library(RVAideMemoire)

#2. Import your data

squids <- read_csv("squids.csv")  

#3. Run descriptive statistics

pivot(squids, c(IQR, skew, kurtosis, mean, sd, var), fish_in_stomach)

#4.Visualize your distribution

ggplot(squids, aes(x = fish_in_stomach, fill = population)) + geom_density()
ggplot(squids, aes(x = fish_in_stomach, fill = population)) + geom_boxplot()

#5. Visualize the sample means and standard deviations


#6. Test for normality and other assumptions (equal variance) (mental check for paired or not)

#Shapiro-Wilks
install.packages("RVAideMemoire")
library(RVAideMemoire)

byf.shapiro(fish_in_stomach~population, data=squids)

#var.test
var.test(fish_in_stomach~population, data=squids)

#7. Run the code for the appropriate test
wilcox.test(fish_in_stomach~population, data=squids,
       alternative = c("two.sided"),
       mu = 0, 
       paired = FALSE, 
       var.equal = TRUE,
       conf.level = 0.95)

















x<-round(rpois(43, lambda = 3), digits=0)
y<-round(rnorm(48, mean=6.3, sd=3.4), digits=0)

squids <- tibble(population = c(rep("population_one", 43),rep("population_two", 48)), fish_in_stomach = c(x, y))

write.csv(squids, "squids.csv")

