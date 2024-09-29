### M6: z-score group work  ###
### NR 2400
### Spring 2024



#loading in the libraries we will use
library(tidyverse)
library(lessR)
library(readxl)
library(BSDA)


#open data
climate_data <- read_xlsx("Lecture Practice/Global Climate Anomalies.xlsx")

#take a look - do they mostly seem to be numbers (label: <dbl>)?
glimpse(climate_data)


#what does this plot look like? normal?
ggplot(climate_data, aes(x = `Annual Anom J-D`)) + geom_density()


#How do we test for normality?
shapiro.test(climate_data$`Annual Anom J-D`)

shapiro.test(filter(climate_data, Era=="Historical")$`Annual Anom J-D`)

#But that is all the columns...
View(climate_data)

#What if we want just historical? 
#Report the p-value for the goodness of fit test for the historical data only
?dplyr::filter

#filter() allows us to choose which rows we want!
#This is looking at our climate_data dataset, but only choosing
#the rows where "Era" is "Historical"
filter(climate_data, Era=="Historical")

#And look at it:
View(filter(climate_data, Era=="Historical"))
#Notice that is only the historical data? We can feed that into functions. 


#Report the p-value for the goodness of fit test for the historical data only
ggplot(filter(climate_data, Era=="Historical"), 
       aes(x = `Annual Anom J-D`)) + geom_density()

shapiro.test(climate_data$`Annual Anom J-D`)
shapiro.test(filter(climate_data, Era=="Historical")$`Annual Anom J-D`)
#What do we think of that?
#I have just replaced "climate_data" with "filter(climate_data, Era=="Historical")"


#Question 5: Same idea here
#Report the mean of the baseline population era annual anom J-D. This will be your hypothesized population mean that you test.
#What do we want in the quotes after "Era=="? (scroll down for answer)
filter(climate_data, Era=="")










#If you guessed "Base Population", you were right! 
filter(climate_data, Era=="Base Population")

#So what is the mean?
mean(filter(climate_data, Era=="Base Population")$`Annual Anom J-D`)
#And sd?
sd(filter(climate_data, Era=="Base Population")$`Annual Anom J-D`)

mean(filter(climate_data, Era=="Historical")$`Annual Anom J-D`)
#And sd?
sd(filter(climate_data, Era=="Historical")$`Annual Anom J-D`)
#Now, for a z-test

#First, we need this new package. 
install.packages("BSDA")

#And load it!
library(BSDA)
z.test(x=filter(climate_data,Era=="Historical")$`Annual Anom J-D`,
       mu=53.8,
       alternative = "two.sided",
       sigma.x = 22.63869)


#Here is a plot of the three distributions
ggplot(climate_data, aes(x = `Annual Anom J-D`, fill = Era)) + 
  geom_density()

#And the Anthropocene test
#Make sure to do the other portions as well, such as normality!
z.test(x=filter(climate_data,Era=="Anthropocene")$`Annual Anom J-D`,
       mu=53.8,
       alternative = "two.sided",
       sigma.x = 22.63869)

