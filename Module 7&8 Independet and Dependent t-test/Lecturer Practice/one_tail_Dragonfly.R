# NR2990 #
# Mobule 8 Online Work #
# t-test in R #

#What is first?!?!?!?! Load _____?


# We'll use our dragonflies dataset this week
# This is a dataset measuring mercury in the bodies of dragonflies of two families:
dragonflies <-read_csv("Dragonfly_THg_Database.csv")

browseURL("https://en.wikipedia.org/wiki/Aeshnidae")
browseURL("https://en.wikipedia.org/wiki/Libellulidae")


#What do we see here?
ggplot(dragonflies, aes(x = Total_mercury_ng_per_g, fill=Family)) + geom_density()

#Can't really see the red  group... 
ggplot(dragonflies, aes(x = Total_mercury_ng_per_g, fill=Family)) + geom_density(alpha=0.5)



#What is our question?





#1) Equal variance test - are the *variances* of the two groups equal? 
#The statistical hypotheses are:
  
#Null hypothesis (H0): the variances of the two groups are equal.
#Alternative hypothesis (Ha): the variances are different.

var.test(Total_mercury_ng_per_g ~ Family, data=dragonflies)

# The p-value is p = 0.5749 which is greater than the significance level 0.05. 
#In conclusion, there is no significant difference between the two variances.

#2) Paired? 


#3) the t-test! 

#What is H0?

t.test(filter(dragonflies,Family=="Aeshnidae")$Total_mercury_ng_per_g, 
       filter(dragonflies,Family=="Libellulidae")$Total_mercury_ng_per_g,
       alternative = c("two.sided"),
       mu = 0, 
       paired = FALSE, 
       var.equal = TRUE,
       conf.level = 0.95)



