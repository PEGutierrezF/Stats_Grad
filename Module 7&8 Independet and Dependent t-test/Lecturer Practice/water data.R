# T-Tests Practice #
# NR2990 #
# This is the standard practice outline we'll follow for the tests as we move through the semester.
# You can add your code to the outline after each comment, then scroll to the bottom to see how we did it:

#Here is the question: Are these two streams the same depth?
  

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

#2. Import your data

stream_data <- read_csv("waterdata.csv")  

#3. Run descriptive statistics

pivot(stream_data, c(IQR, skew, kurtosis, mean, sd, var), depth_cm)

#4.Visualize your distribution

ggplot(stream_data, aes(x = depth_cm, fill = waterbody)) + geom_density()
ggplot(stream_data, aes(x = depth_cm, fill = waterbody)) + geom_boxplot()

#5. Visualize the sample means and standard deviations


#6. Test for normality and other assumptions (equal variance) (mental check for paired or not)

#Shapiro-Wilks
install.packages("RVAideMemoire")
library(RVAideMemoire)

byf.shapiro(depth_cm~waterbody, data=stream_data)

#var.test
var.test(depth_cm ~ waterbody, data=stream_data)

#7. Run the code for the appropriate test
t.test(depth_cm ~ waterbody, data=stream_data,
       alternative = c("two.sided"),
       mu = 0, 
       paired = FALSE, 
       var.equal = TRUE,
       conf.level = 0.95)

















x<-round(rnorm(33, mean=43.5, sd=3.3), digits=1)
y<-round(rnorm(38, mean=56.3, sd=3.4), digits=1)

waterdata <- tibble(waterbody = c(rep("stream1", 33),rep("stream2", 38)), depth_cm = c(x, y))

write.csv(waterdata, "waterdata.csv", row.names=TRUE)

