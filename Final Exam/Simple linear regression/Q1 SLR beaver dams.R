



# --------------------------------------------------------
# Simple Linear Regression
# Date: Tue Dec 05 2024 12:25:30
# Pablo E. Gutierrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# --------------------------------------------------------


library(tidyverse)
library(lessR)
library(readxl)
library(RVAideMemoire)
library(car)
library(DescTools)
library(rstatix)
library(PMCMRplus)


In recent decades, beavers have expanded beyond their typical habitats and begun colonizing 
the Arctic tundra. Jones et al. collected data on surface water area and surveyed beaver 
dams to investigate how beaver activity influences hydrology in this region. Beaver dams 
create localized flooding around water bodies, potentially impacting the Arctic\s hydrology 
and carbon cycling.

Using data from the Baldwin Peninsula in Alaska, Jones and colleagues analyzed surface 
water area and the number of beaver dams over nearly two decades. In this question, 
evaluate whether the presence of beaver dams is associated with an increase in surface 
water in the tundra.

Perform a linear regression to assess whether there is a significant relationship between 
the number of beaver dams and surface water area. Write a concise paragraph summarizing 
your results and conclusions, ensuring you clearly interpret the regression coefficients 
and significance.


data <- read.csv('beaver_dam.csv')
head(data)


#set up regression
mod <- lm(area.ha ~ dams.n, data)
summary(mod)

#get standardized residuals
dam.res <- rstandard(mod)
shapiro.test(dam.res)

#the Breusch-Pagan test to assess homoscedasticity
library(car)
ncvTest(mod)


#Cooks D
ggplot(as_tibble(cooks.distance(mod)), aes(value)) + geom_boxplot()
plot(mod,which=4)


#make plot of beaver dams and surface water
plot(area.ha ~ dams.n, data, 
     pch = 19, 
     col = "royalblue4",
     ylab = "Surface water area (ha)",
     xlab =  "Number of beaver dams")
#add regression line
#make line width thicker
abline(mod, lwd=2)


