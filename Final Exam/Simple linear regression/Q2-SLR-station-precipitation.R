



# --------------------------------------------------------
# Simple Linear Regression
# Date: Fri Dec 06 2024 11:29:39
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

data <- read.csv('Q2-SLR-station precipitation.csv')
head(data)


#set up regression
mod <- lm(l_1 ~ pm_wnt_ppt, data)
summary(mod)

#get standardized residuals
dam.res <- rstandard(mod)
shapiro.test(dam.res)

#the Breusch-Pagan test to assess homoscedasticity
ncvTest(mod)


#Cooks D
ggplot(as_tibble(cooks.distance(mod)), aes(value)) + geom_boxplot()
plot(mod,which=4)

