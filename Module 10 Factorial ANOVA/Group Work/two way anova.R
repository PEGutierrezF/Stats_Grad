

rm(list = ls())

frog <- read.csv("UV_deformities.csv")
summary(frog)
head(frog)

shapiro.test(deformities)
hist(deformities)

frog <- na.omit(frog)

# Transform deformities into ranks
frog$ranked_deformities <- rank(frog$deformities)

# Run an ANOVA with site, treatment, species, and interaction between treatment and species
model <- aov(ranked_deformities ~ site + treatment * species, data = frog)
summary(model)


# Post hoc test using Tukey's HSD
TukeyHSD(model)

# Create the interaction plot
interaction.plot(x.factor = frog.new$treatment, 
                 trace.factor = frog.new$species, 
                 response = frog.new$rank, 
                 fun = mean, 
                 type = "b", 
                 legend = TRUE, 
                 xlab = "Treatment", 
                 ylab = "Mean Rank")


