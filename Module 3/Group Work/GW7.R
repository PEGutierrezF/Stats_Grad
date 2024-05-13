
#### NR2400 ####
#### Group Work 7 ####


#loading in the libraries we will use
library(tidyverse)
library(lessR)
library(DT)
library(e1071)
library(readxl)
library(stats)
library(BSDA)

nests <- read.csv("Laloe??_et_al._2020_Ecol_Evol_dataset.csv")

pivot(nests, c(mean, sd), nestTemperature)

ggplot(nests, aes(x = nestTemperature)) + geom_density()

yourNests <- read_xlsx("yourTurtleData.xlsx")
pivot(nests, c(mean, sd), nestTemperature)

z.test(x=yourNests$nestTemperature,
       mu=31.2,
       alternative = "two.sided",
       sigma.x = 1.822)

