
# create sample data frame
sample_data <- data.frame( x= c(1,2,3,4,5,6,7,7,7,8),
                           y= c(4,5,6,7,8,9,9,9,10,10),
                           z= c(1,3,5,7,9,11,13,15,17,19))

# load library ppcor
library(ppcor)

# calculate Partial Correlation
pcor(sample_data)
