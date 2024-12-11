


# --------------------------------------------------------
# 
# Date: Sun Dec 08 2024 14:29:44
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



data <- read.csv('Q3-SLR-water consumption.csv')
head(data)


#set up regression
mod1 <- lm(WC ~ POP, data)
summary(mod1)

#get standardized residuals
mod1.res <- rstandard(mod1)
shapiro.test(mod1.res)

#the Breusch-Pagan test to assess homoscedasticity
ncvTest(mod1)

