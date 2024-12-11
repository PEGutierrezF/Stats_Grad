



# --------------------------------------------------------
# One sample t-test
# Date: Wed Dec 11 2024 16:18:11
# Pablo E. Gutierrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# --------------------------------------------------------

library(tidyverse)
library(BSDA)
water <- read_csv('winooski_pfas.csv')

mean(water$pfas_ppt)
sd(water$pfas_ppt)

shapiro.test(water$pfas_ppt)

z.test(water$pfas_ppt,
       mu=13.3,
       sigma.x=3.228349,
       alternative='less')

# by hand
z_value <- (12.40623-13.3)/(3.228349/sqrt(24))
z_value

p_value <- pnorm(z_value)
p_value
