



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

data$fecal_coliform_log <- log(data$fecal_coliform)

#variance
bartlett.test(fecal_coliform_log ~ season, data)

#normality
byf.shapiro(fecal_coliform_log ~ season, data)

mod <- aov(fecal_coliform_log ~ season, data)
summary(mod)


