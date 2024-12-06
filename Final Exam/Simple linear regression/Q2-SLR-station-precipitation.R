



# --------------------------------------------------------
# Simple Linear Regression
# Date: Fri Dec 06 2024 11:29:39
# Pablo E. Gutierrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# --------------------------------------------------------


library(tidyverse)
library(lessR)
library(readxl)
library(RVAideMemoire)
library(car)
library(DescTools)
library(rstatix)
library(PMCMRplus)

data <- read.csv('Q2-SLR-station precipitation.csv')
head(data)


#set up regression
mod1 <- lm(l_1 ~ pm_wnt_ppt, data2)
summary(mod1)

#get standardized residuals
mod1.res <- rstandard(mod1)
shapiro.test(mod1.res)

#the Breusch-Pagan test to assess homoscedasticity
ncvTest(mod1)


#Cooks D
ggplot(as_tibble(cooks.distance(mod1)), aes(value)) + geom_boxplot()
plot(mod1,which=4)


# Plot the Cook's Distance using the traditional 4/n criterion
cooksD <- cooks.distance(mod1)
sample_size <- nrow(data)
plot(cooksD, pch="*", cex=2, main="Influential Obs by Cooks distance")  # plot cook's distance
abline(h = 4/sample_size, col="red")  # add cutoff line
text(x=1:length(cooksD)+1, y=cooksD, labels=ifelse(cooksD>4/sample_size, names(cooksD),""), col="red")  # add labels


# Removing Outliers
# influential row numbers
influential <- as.numeric(names(cooksD)[(cooksD > (4/sample_size))])

# Alternatively, you can try to remove the top x outliers to have a look
# top_x_outlier <- 2
# influential <- as.numeric(names(sort(cooksd, decreasing = TRUE)[1:top_x_outlier]))

data2 <- data[-influential, ]

plot3 <- ggplot(data = data, aes(x = pm_wnt_ppt, y = l_1)) +
  geom_point() + 
  geom_smooth(method = lm) +
 # xlim(0, 20) + ylim(0, 220) + 
  ggtitle("Before")
plot4 <- ggplot(data = data2, aes(x = pm_wnt_ppt, y = l_1)) +
  geom_point() + 
  geom_smooth(method = lm) +
#  xlim(0, 20) + ylim(0, 220) + 
  ggtitle("After")

gridExtra::grid.arrange(plot3, plot4, ncol=2)
