



# --------------------------------------------------------
# Two-tailed, Wilcoxon independent t-test
# Date: Wed Dec 11 2024 16:37:41
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

fish <- read_xlsx("SwimTable.xlsx")  
head(fish)

#3. Run descriptive statistics

pivot(fish, c(IQR, skew, kurtosis, mean, sd, var), Swim_Speed)

#4.Visualize your distribution

ggplot(fish, aes(x = Swim_Speed, fill = Common_Name)) + geom_density()
ggplot(fish, aes(x = Swim_Speed, fill = Common_Name)) + geom_boxplot()

#5. Test for normality 

#Shapiro-Wilks
install.packages("RVAideMemoire")
library(RVAideMemoire)

byf.shapiro(Swim_Speed~Common_Name, fish)

#6. Test for equal variance

#var.test
var.test(Swim_Speed~Common_Name, fish)

#7. Mental check for paired or unpaired

# Nope!
  
#8. Run the code for the appropriate test
  
wilcox.test(Swim_Speed~Common_Name, fish,
            alternative = c("two.sided"),
            mu = 0,
            paired = FALSE, 
            var.equal = TRUE,
            conf.level = 0.95)





