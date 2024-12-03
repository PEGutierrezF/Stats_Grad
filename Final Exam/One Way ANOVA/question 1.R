



# --------------------------------------------------------
# One way Anova Question
# Date: Tue Dec 03 2024 12:25:30
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


data <- read_excel('fecal_coliforms.xlsx')
head(data)

#variance
bartlett.test(fecal_coliform ~ season, data)

#normality
byf.shapiro(fecal_coliform ~ season, data)

mod <- aov(fecal_coliform ~ season, data)
summary(mod)


