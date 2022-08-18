# Importing data ---------------------------------------------------------------

# This data comes from palmerpenguins library.
# We're importing data in this way to avoid inconsistencies
# if the data in the package changes..
penguins <- read.csv("data/raw/penguins.csv")
penguins_raw <- read.csv("data/raw/penguins_raw.csv")

# Checking data
head(penguins)
dim(penguins)
summary(penguins)

head(penguins_raw)
dim(penguins_raw)
summary(penguins_raw)

# Checking data more carefully
View(penguins)
View(penguins_raw)
