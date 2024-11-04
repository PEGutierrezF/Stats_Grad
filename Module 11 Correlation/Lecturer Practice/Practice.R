


install.packages('ppcor')
library(tidyverse)
library(lessR)
library(readxl)
library(PMCMRplus)
library(ggplot2)
library(ppcor)
library(ggpubr) 

# Install
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggcorrplot")
library(ggcorrplot)

# Global Temperature ------------------------------------------------------
global_T <- read_xlsx('global mean T.xlsx')
head(global_T)
# Perform Shapiro-Wilk test on flipper length by species
shapiro.test(global_T$temperature)
shapiro.test(global_T$Mona_Loa_co2)


#Test correlation (parametric)
test <- cor.test(global_T$temperature,
         global_T$Mona_Loa_co2,
         method = "spearman")
test
r_2 <- 0.9332148 ^ 2
r_2

# Extract correlation coefficient and p-value
correlation_coefficient <- test$estimate
p_value <- test$p.value


# Create scatter plot
plot <- ggplot(global_T, aes(x = Mona_Loa_co2, y = temperature)) +
  geom_line() +
  geom_point() +
  geom_smooth() +
#  ylim(14,14.75) +
  labs(x = "CO2 (ppm)", y = "Temperature (C)", title = "") +
  annotate("text", x = 350, y = 14.8, 
           label = paste("Spearman's correlation =", round(correlation_coefficient, 2), "\n", 
                         "p =", format.pval(p_value)),
           hjust = 1, vjust = 0)

plot


# Simple Correlation Butterflies ------------------------------------------
butterflies <- read_xlsx('butterflies.xlsx')

# Perform Shapiro-Wilk test on flipper length by species
shapiro.test(butterflies$Length)
shapiro.test(butterflies$Fitness)


#Test correlation (parametric)
test <- cor.test(butterflies$Length,
                 butterflies$Fitness,
                 method = "spearman")

r_2 <- -0.6290461 ^ 2


# Partial correlation -----------------------------------------------------
chem <- read_xlsx('ACSA_foliar_chemistry.xlsx')
head(chem)

# Calculate partial correlations
parcor <-
  pcor(na.omit(as.data.frame(dplyr::select(
    chem, where(is.numeric)
  ))))
print(parcor)

pcor(na.omit(chem))




ggcorrplot(data, hc.order = TRUE, type = "lower",
           lab = TRUE)

# Compute a correlation matrix
data <-  na.omit(chem)
corr <- round(cor(data), 1)
ggcorrplot(corr, hc.order = TRUE, type = "lower",
           lab = TRUE)
