



# --------------------------------------------------------
# Two-tailed, Wilcoxon independent t-test
# Date: Wed Dec 11 2024 17:00:49
# Pablo E. Gutierrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# --------------------------------------------------------





#1. Import libraries and load packages

library(tidyverse)
library(lessR)
library(readxl)
library(BSDA)
library(RVAideMemoire)

#2. Import your data

malaria <- read_xlsx("forest_malaria.xlsx")  
head(malaria)

#3. Run descriptive statistics

pivot(malaria, c(IQR, skew, kurtosis, mean, sd, var), Malaria_cases)

#4.Visualize your distribution

ggplot(malaria, aes(x = Malaria_cases, fill = Forest_type)) + geom_density()
ggplot(malaria, aes(x = Malaria_cases, fill = Forest_type)) + geom_boxplot()

#5. Test for normality 

#Shapiro-Wilks

byf.shapiro(Malaria_cases~Forest_type, malaria)

#6. Test for equal variance

#var.test
var.test(Malaria_cases~Forest_type, malaria)

#7. Mental check for paired or unpaired

# Nope!

#8. Run the code for the appropriate test

t.test(Malaria_cases~Forest_type, malaria,
            alternative = c("two.sided"),
            mu = 0,
            paired = FALSE, 
            var.equal = FALSE,
            conf.level = 0.95)

