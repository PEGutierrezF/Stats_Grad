### M5 Problem Set ###
### Template Script ###

################################################################
### Where there is XXX you will need to add in your own code! ##
################################################################

#Import your data  into R.  
#Analyze the distribution of both the Dreaming and Non-Dreaming variables.  
#We’ll start by just examining some of the descriptive statistics and what they tell us about this data.

#installing lessR 
install.packages("lessR")
install.packages("tidyverse")

#loading in the libraries we will use
library(tidyverse)
library(lessR)
library(readxl)

#open up our data
sleeping <- read_xlsx("XXX")

#take a look at it... 
View(sleeping)

#pivot gives us more summary statistics, for Non-Dreaming sleep:
pivot(XXX, c(IQR, skew, kurtosis, mean, sd, var), XXX)
#and dreaming sleep.
pivot(XXX, c(IQR, skew, kurtosis, mean, sd, var), XXX)


#Now we will be testing distributions.  We will examine one variable at a time.  We will start with the Dreaming variable:
#Fit a normal distribution and test for normality using the shapiro.wilks() test. 

shapiro.test(XXX$XXX)


#Now, Non-Dreaming
shapiro.test(XXX$XXX)


#Lets plot them both to see what is happening!
ggplot(data = XXX, mapping = aes(x = XXX)) + geom_density()

#And non-dreaming
ggplot(data = XXX, mapping = aes(x = XXX)) + geom_density()

#Does NonDreaming seem normal visually? 


#Now, we need to look at the small and large mammals separately
#This involves filtering the data!

#Note the "double =="
filter(sleeping, Mammalian_Size_Group=='large')
#here is the nondreaming value for all mammals
pivot(sleeping, c(IQR, skew, kurtosis, mean, sd, var), NonDreaming)
#and look closely here at what is different for the large mammals
pivot(filter(sleeping, Mammalian_Size_Group=='large'), c(IQR, skew, kurtosis, mean, sd, var), NonDreaming)

#Here are the z-scores for the large group:
  #Baboon
  (9.1-5.155)/2.99
  #Patas Monkey
  (10-5.155)/2.99
  #Rhesus Monkey
  (8.4-5.155)/2.99
  #Roe Deer
  (2.2-5.155)/2.99
  

#Now, your turn for small mammals:
filter(XXX, Mammalian_Size_Group==XXX)
pivot(filter(XXX, Mammalian_Size_Group==XXX), c(IQR, skew, kurtosis, mean, sd, var), XXX)

#Here are the z-scores for the small group:
  #Baboon
  XXX
  #Patas Monkey
  XXX
  #Rhesus Monkey
  XXX
  #Roe Deer
  XXX


#This code will be helpful for the remainder of the questions... 

qnorm(XXX, mean=0, sd = 1, lower.tail = XXX)
qnorm(XXX, mean=0, sd = 1, lower.tail = XXX)


pnorm(XXX, mean=0, sd = 1, lower.tail = XXX)
qnorm(XXX, mean=XXX, sd = XXX, lower.tail = XXX)


qnorm(XXX, mean=XXX, sd = XXX, lower.tail = FALSE)

qnorm(XXX, mean = XXX, sd = XXX, lower.tail = FALSE)



