### ANOVA Group Work ###
### NR 2990 ###

#Libraries!
library(tidyverse)
library(lessR)
library(readxl)
library(RVAideMemoire)
library(car)
library(DescTools)
library(rstatix)
library(PMCMRplus)


#Load data
XXX <- read_csv("XXX")  
#OR
XXX <- read_xlsx("XXX")  

#Plot data - you will need to replace the "XXX" with the new data
#Here is a new type of plot
ggplot(XXX) + (aes(x = XXX, y = XXX, color = XXX)) + geom_jitter()

#Our histogram
ggplot(XXX) + aes(x = XXX, fill = XXX) + geom_density(alpha=.7) 

#boxplot
ggplot(XXX) + aes(x = XXX, fill = XXX) + geom_boxplot() 


#descriptive stats - pivot table
#
pivot(filter(XXX, XXX=="XXX"), c(IQR, mean, min,max,var,sd,skew,kurtosis), XXX)
#
pivot(filter(XXX, XXX=="XXX"), c(IQR, mean, min,max,var,sd,skew,kurtosis), XXX)
#
pivot(filter(XXX, XXX=="XXX"), c(IQR, mean, min,max,var,sd,skew,kurtosis), XXX)

#normality
byf.shapiro(XXX~XXX, data=XXX)

#variance
bartlett.test(XXX ~ XXX, data=XXX)




### Option 1 ###
#Normal AND Equal Variances

# Compute the analysis of variance
XXX_aov <- aov(XXX ~ XXX, data = XXX)
summary(XXX_aov)
#All pairs comparison
  TukeyHSD(XXX_aov)
  #or
  dscfAllPairsTest(XXX ~ XXX, data = XXX)
#effect size
EtaSq(XXX, type=1, anova=TRUE)


### Option 2 ###
#Normal BUT NON-Equal Variances
welch_anova_test(XXX ~ XXX, data=XXX)
#All Pairs
wilcox_test(XXX ~ XXX, data=XXX, p.adjust.method = "bonferroni")
#Effect Size
kruskal_effsize(XXX ~ XXX, data = XXX)


### Option 3 ###
#NOT Normal AND NON-Equal Variances
kruskal_test(XXX ~ XXX, data=XXX)
#All Pairs
wilcox_test(XXX ~ XXX, data=XXX, p.adjust.method = "bonferroni")
#Effect Size
kruskal_effsize(XXX ~ XXX, data = XXX)
























