

library(readxl)
library(BSDA)
library(dplyr)
library(ggplot2)


Chen et al. (2011) wanted to test the idea that organisms move to higher 
elevation as the climate warms. To test this, they collected data from 31 species, 
plotted below.

df <- read.csv('range_shift_data.csv')
head(df)

# Plot
range_shift <- df |> 
  mutate(x = "", uphill = elevationalRangeShift > 0)

ggplot(range_shift, aes(x = x, y = elevationalRangeShift))+
  geom_jitter(aes(color = uphill), width = .05, height = 0, size = 2, alpha = .7)+
  geom_hline(yintercept = 0, lty= 2)+
  stat_summary(fun.data = "mean_cl_normal") + 
  theme(axis.title.x = element_blank())

# Normality test
shapiro.test(df$elevationalRangeShift)

# Estimate parameters
mean_pop <- 0
sd_pop <- sd(df$elevationalRangeShift)

# Run z.test
z.test(df$elevationalRangeShift,
       alternative='greater',
       mu=mean_pop,
       sigma.x=sd_pop)


References

Chen, I-Ching, Jane K. Hill, Ralf Ohlemüller, David B. Roy, and Chris D. Thomas. 
2011. “Rapid Range Shifts of Species Associated with High Levels of Climate Warming.” 
Science 333 (6045): 1024–26. https://doi.org/10.1126/science.1206432.

https://bookdown.org/ybrandvain/Applied-Biostats/t.html#ref-Chen2011


