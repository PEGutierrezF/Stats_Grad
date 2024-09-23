### This is the code for the Quiz for Module 5. 


#Make sure we are in the right place
setwd(dir = "~/Desktop/NR2990")
getwd()

#and make sure our libraries are loaded:
library(tidyverse)
library(lessR)
library(readxl)

#R comes with a number of built-in datasets. Here is one which is about 
#irises, a type of flower, and the measurements of those flowers.
iris_data <- as.tibble(iris)

#Look at the data
#How many species?

#What is happening here?
ggplot(iris_data, aes(x = Petal.Length)) + geom_histogram()


#this separates things out by the different species
ggplot(iris_data, aes(x = Petal.Length, fill = Species)) + 
  geom_histogram()

#Separate out by species
setosa_only <- filter(iris_data, Species == "setosa")

#What is the dataset you'll be using for this histogram? 
#Type it in after "data="
ggplot(data=setosa_only, aes(x = Petal.Length, fill = Species)) + 
  geom_histogram()

shapiro.test(setosa_only$Petal.Length)
#Is the data normal? 

#z-score questions
#z_score <- (value-mean)/sd
sd(setosa_only$Petal.Length)
mean(setosa_only$Petal.Length)


#What is the probability of finding a setosa iris with a petal length
#longer than 1.75?




