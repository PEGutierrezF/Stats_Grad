

library(dplyr)
library(tibble)
library(explore)
library(ggplot2)

# Loading
data(trees)
# Print the first 6 rows
head(trees)


# Number of rows (observations)
nrow(trees)
# Number of columns (variables)
ncol(trees)

str(trees)   # Show the structure of the trees dataframe

summary(trees)

ggplot(trees, aes(x=Girth,y=Volume)) +
  geom_point()
