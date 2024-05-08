

rm(list = ls())

frog <- read.csv("twowayanova.csv")
attach(frog)
head(frog)

shapiro.test(response)
hist(response)

frog.new <- na.omit(frog)

# Apply the rank transformation to the response variable
frog.new$rank <- rank(frog.new$response)
shapiro.test(frog.new$rank)


mod1 <- aov(rank~(treatment*species)+site, data=frog.new)
summary(mod1)


TukeyHSD(mod1, which = 'treatment:species')

# Create the interaction plot
interaction.plot(x.factor = frog.new$treatment, 
                 trace.factor = frog.new$species, 
                 response = frog.new$rank, 
                 fun = mean, 
                 type = "b", 
                 legend = TRUE, 
                 xlab = "Treatment", 
                 ylab = "Mean Rank")


