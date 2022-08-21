# Reading raw data -------------------------------------------------------------
penguins <- read.csv("data/raw/penguins.csv")
penguins_raw <- read.csv("data/raw/penguins_raw.csv")

head(penguins)
View(penguins)

head(penguins_raw)
View(penguins_raw)

# Checking data agreement ------------------------------------------------------

# Both dataframes refer to the same set of penguins
# Information in penguins is already cleaned to a large extent
# Information in penguin_raw is more extensive

#They have the same number of row
nrow(penguins) == nrow(penguins_raw)

# Checking columns names in each datafraeme
# Some of them supposedly have the same information but have different names
names(penguins)
names(penguins_raw)

# Identical information for island, bill length, bill depth,
# flipper length and body mass
identical(penguins$island,penguins_raw$Island)
identical(penguins$bill_length_mm,penguins_raw$Culmen.Length..mm.)
identical(penguins$bill_length_mm, penguins_raw$Culmen.Length..mm.)
identical(penguins$bill_depth_mm, penguins_raw$Culmen.Depth..mm.)
identical(penguins$flipper_length_mm,penguins_raw$Flipper.Length..mm.)
identical(penguins$body_mass_g, penguins_raw$Body.Mass..g.)

# The informations about sex and species are in different formats
head(penguins$sex)
head(penguins_raw$Sex)

head(penguins$species)
head(penguins_raw$Species)

# Thus we need to transform them before comparing
# They are indeed identical
penguins_raw <- transform(penguins_raw, Sex2 = tolower(Sex))
identical(penguins_raw$Sex2,penguins$sex)

library(stringr)
penguins_raw <- transform(penguins_raw, Species2 = word(Species,1))
identical(penguins$species, penguins_raw$Species2)

# Merging data -----------------------------------------------------------------

# We will add two columns from the raw the dataframe to the other one
# That data will be useful in our analysis

# First we will count how many rows in the dataframe have NAs
sum(apply(penguins, 1, anyNA))

library(visdat)
vis_miss(penguins)

# Now we add the new columns
penguins$nitrogen_isotope_ratio <- penguins_raw$Delta.15.N..o.oo.
penguins$carbon_isotope_ratio <- penguins_raw$Delta.13.C..o.oo.

#The number of rows with NAs has not increased much
sum(apply(penguins, 1, anyNA))

vis_miss(penguins)

# Only around six percent of rows have NAs
sum(apply(penguins, 1, anyNA))/dim(penguins)[1]

# We will let go rows with incomplete information
penguins <- na.omit(penguins)

vis_miss(penguins)

# Storing data -----------------------------------------------------------------

if (!dir.exists("data/processed")) dir.create("data/processed")
write.csv(penguins, "data/processed/02_penguins.csv", row.names = FALSE)

