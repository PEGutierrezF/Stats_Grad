

library(openxlsx)
birds <-  read.xlsx("bird_migration.xlsx")

#var.test
var.test(pre_wt~Species, data=birds)


#7. Run the code for the appropriate test (for Analysis 1)
t.test(pre_wt~Species, data=birds,
       alternative = c("two.sided"),
       mu = 0, 
       paired = FALSE, 
       var.equal = TRUE,
       conf.level = 0.95)

# 8 effect size
library(effectsize)
cohens_d(pre_wt~Species, data=birds)
