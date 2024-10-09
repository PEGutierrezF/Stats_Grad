
#NR2400
#Paired t-test example


#1. Import libraries and load packages

#2. Import your data

ice_before_after <- read_csv("ice_storm_data_before_and_after.csv")  

#3. Run descriptive statistics

#4. Visualize your distribution

#5. Test for normality 

#6. Test for equal variance

#7. Mental check for paired or unpaired

#8. Run the code for the appropriate test

t.test(ice_before_after$Control, ice_before_after$Ice)
alternative = c("two.sided"),
mu = 0, 
paired = TRUE, 
var.equal = TRUE,
conf.level = 0.95)

#Effect Size
install.packages("effectsize")
library(effectsize)

cohens_d(Live_BA_m2_per_ha~Treatment, data=ice)
