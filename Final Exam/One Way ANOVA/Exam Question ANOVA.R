



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

Question:
  
  1. Exam Question:
  Biodiversity loss is a critical environmental concern. Urban environments can 
significantly influence the survival and reproduction of insect species. Built 
environments are often warmer, dominated by non-native plants, and have lower 
water availability, particularly in drier regions like California. These factors 
may negatively affect essential ecosystem processes, such as pollination, 
food webs, and the decomposition of plant material.

To investigate the effects of urbanization on insects, Adams et al. (2019) 
conducted a study across the Los Angeles area, trapping insects and measuring 
species richness at each site.

In this study, insect species richness was recorded across three levels of 
urbanization: Suburban, Developed Dense, and Natural environments. Perform 
an ANOVA to assess whether there are significant differences in species 
richness among these urbanization levels. If the results are significant, 
conduct a Tukey post hoc test to identify pairwise differences.

Write a complete and concise paragraph summarizing your results and 
conclusions based on the analysis.

data <- read.csv('insect_richness.csv')
head(data)

data$urbanName <- as.factor(data$urbanName)
unique(data$urbanName)

#variance
bartlett.test(Richness  ~ urbanName, data)

#normality
byf.shapiro(Richness  ~ urbanName, data)

mod <- aov(Richness  ~ urbanName, data)
summary(mod)

tukeyT <- TukeyHSD(mod)
tukeyT
