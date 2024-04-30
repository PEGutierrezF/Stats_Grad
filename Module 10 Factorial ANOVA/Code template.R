



# Code Template: NR-5990
# Practice: Factorial ANOVA
# Pablo E. Gutierrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# Tue Apr 30 13:16:20 2024 ------------------------------


# The Bartlett test is used to test the null hypothesis that the variances are equal across 
# different groups or levels of a categorical variable. 
# Bartlett test for homogeneity of variances
bartlett.test(indepen_var ~ indep_var1 + indep_var2 + indep_var1:indep_var2, data=your_data)
print(bartlett_result)


# Do the factorial ANOVA
# The asterisk (*) is use to indicate all main effects and interactions among the variables
# that it joins. So, for example the term A*B would expand to the three terms 
# indep_var1, indep_var2, and indep_var1:indep_var2.
mod <- aov(depen_var ~ indep_var1 * indep_var2, data = your_data)
summary(mod)


# Run post hoc tests - Tukey HSD
tukey_result <- TukeyHSD(mod)
print(tukey_result)


# Graphical display - to plot CIs from Tukey
plot(tukey_result)
