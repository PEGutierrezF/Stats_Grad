#NR 2990#
#Module 8 Group Work#


#1. Import libraries and load packages

library(tidyverse)
library(lessR)
library(readxl)
library(BSDA)

#2. Import your data

ice <- read_xlsx("ice_storm_data.xlsx")  

#3. Run descriptive statistics

pivot(ice, c(IQR, skew, kurtosis, mean, sd, var), Live_BA_m2_per_ha)
pivot(ice, c(IQR, skew, kurtosis, mean, sd, var), Live_BA_m2_per_ha)

#4.Visualize your distribution

ggplot(ice, aes(x = Live_BA_m2_per_ha, fill = Treatment)) + geom_density(alpha =0.7)
ggplot(ice, aes(x = Live_BA_m2_per_ha, fill = Treatment)) + geom_boxplot()

#5. Visualize the sample means and standard deviations


#6. Test for normality and other assumptions (equal variance) (mental check for paired or not)

  #Shapiro-Wilks

  byf.shapiro(Live_BA_m2_per_ha~Treatment, data=ice)

  #var.test
  var.test(Live_BA_m2_per_ha~Treatment, data=ice)

  
#7. Run the code for the appropriate test (for Analysis 1)
t.test(Live_BA_m2_per_ha~Treatment, data=ice,
       alternative = c("two.sided"),
       mu = 0, 
       paired = FALSE, 
       var.equal = TRUE,
       conf.level = 0.95)

#Effect Size
#install.packages("effectsize")
#library(effectsize)

cohens_d(Live_BA_m2_per_ha~Treatment, data=ice)

#(for Analysis 2) - Examine if there is a decrease in live basal area (m2/ha) for ice treated compared to control plots 1 year after the initial treatment. 
t.test(Live_BA_m2_per_ha~Treatment, data=ice,
       alternative = c("greater"),
       mu = 0, 
       paired = FALSE, 
       var.equal = TRUE,
       conf.level = 0.95)

cohens_d(Live_BA_m2_per_ha~Treatment, data=ice)


#(for Analysis 3) - Non-normal data, so Wilcoxon
wilcox.test(Live_BA_m2_per_ha~Treatment, data=ice,
       alternative = c("two.sided"),
       mu = 0, 
       paired = FALSE, 
       var.equal = TRUE,
       conf.level = 0.95)

cohens_d(Live_BA_m2_per_ha~Treatment, data=ice)


#(for Analysis 4) - one tailed and dependent.
ice30 <- ice |> add_row(`Plot ID` = 30, Treatment ="Control", Live_BA_m2_per_ha=42.34, LAI=8.23)


t.test(Live_BA_m2_per_ha~Treatment, data=ice30,
       alternative = c("greater"),
       mu = 0, 
       paired = TRUE, 
       var.equal = TRUE,
       conf.level = 0.95)

cohens_d(Live_BA_m2_per_ha~Treatment, data=ice)



