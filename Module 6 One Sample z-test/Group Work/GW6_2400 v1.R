


climate_data <- read_xlsx("Global Climate Anomalies.xlsx")

# Population mean and SD --------------------------------------------------
baseline <- climate_data %>% 
  filter(Era=="Base Population") 

mean_baseline <- mean(baseline$`Annual Anom J-D`)
sd_baseline <- sd(baseline$`Annual Anom J-D`)


# Histotical vs baseline --------------------------------------------------
shapiro.test(filter(climate_data,Era=="Historical")$`Annual Anom J-D`)
z.test(x=filter(climate_data,Era=="Historical")$`Annual Anom J-D`,
       alternative = 'two.sided',
       mu=mean_baseline,
       sigma.x=sd_baseline)

# Anthopocene vs baseline --------------------------------------------------
shapiro.test(filter(climate_data,Era=="Anthropocene")$`Annual Anom J-D`)
z.test(x=filter(climate_data,Era=="Anthropocene")$`Annual Anom J-D`,
       alternative = 'two.sided',
       mu=mean_baseline,
       sigma.x=sd_baseline)
