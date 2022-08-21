# The objective is to be able to discriminate between penguin species
# using morphometric data

library(ggplot2)
library(gridExtra)

penguins <- read.csv("data/processed/02_penguins.csv")

head(penguins)
summary(penguins)

# Species present in the dataset
unique(penguins$species)

# Number of individuals from each species
table(penguins$species)

# Bill length may be useful to discriminate between Adelie and other species
tapply(X = penguins$bill_length_mm, INDEX=list(penguins$species), FUN=mean)
tapply(X = penguins$bill_length_mm, INDEX=list(penguins$species), FUN=sd)

# Bill depth may be useful to discriminate between Gento and other species
tapply(X = penguins$bill_depth_mm, INDEX=list(penguins$species), FUN=mean)
tapply(X = penguins$bill_depth_mm, INDEX=list(penguins$species), FUN=sd)

# Flipper length may be a useful parameter to discriminate the three species
tapply(X = penguins$flipper_length_mm, INDEX=list(penguins$species), FUN=mean)
tapply(X = penguins$flipper_length_mm, INDEX=list(penguins$species), FUN=sd)

# Body mass may be useful to discriminate between Gento and other species
tapply(X = penguins$body_mass_g, INDEX=list(penguins$species), FUN=mean)
tapply(X = penguins$body_mass_g, INDEX=list(penguins$species), FUN=sd)

# Plots can show a better figure about it (literaly hehe)
par(mfrow=c(2,2))
boxplot(bill_length_mm ~ species, data = penguins)
boxplot(bill_depth_mm ~ species, data = penguins)
boxplot(flipper_length_mm ~ species, data = penguins)
boxplot(body_mass_g ~ species, data = penguins)

# Density plots of the measures for each species
metric_cols <- names(penguins)[3:6]
plots <- c()

for (i in 1:4){
  plots[[i]] = ggplot(penguins, aes_string(x=metric_cols[1], fill="species")) +
    geom_density(alpha=0.6, position="identity")
}
grid.arrange(grobs = plots, nrow=2)


# Visualizations using sex as a factor -----------------------------------------
# In many animals species strong sexual dimorphism is observed
# This can turn the differentiation of species more difficult

# Sexual dimorphism of bill length
p1 <- ggplot(penguins[penguins$species == "Adelie",], aes(x=bill_length_mm, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Adelie species")

p2 <- ggplot(penguins[penguins$species == "Gentoo",], aes(x=bill_length_mm, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Gentoo species")

p3 <- ggplot(penguins[penguins$species == "Chinstrap",], aes(x=bill_length_mm, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Chinstrap species")
grid.arrange(p1, p2, p3, nrow=3)

# Sexual dimorphism of bill depth
p1 <- ggplot(penguins[penguins$species == "Adelie",], aes(x=bill_depth_mm, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Adelie species")

p2 <- ggplot(penguins[penguins$species == "Gentoo",], aes(x=bill_depth_mm, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Gentoo species")

p3 <- ggplot(penguins[penguins$species == "Chinstrap",], aes(x=bill_depth_mm, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Chinstrap species")
grid.arrange(p1, p2, p3, nrow=3)

# Sexual dimorphism of flipper length
p1 <- ggplot(penguins[penguins$species == "Adelie",], aes(x=flipper_length_mm, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Adelie species")

p2 <- ggplot(penguins[penguins$species == "Gentoo",], aes(x=flipper_length_mm, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Gentoo species")

p3 <- ggplot(penguins[penguins$species == "Chinstrap",], aes(x=flipper_length_mm, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Chinstrap species")
grid.arrange(p1, p2, p3, nrow=3)

# Sexual dimorphism of body weight
p1 <- ggplot(penguins[penguins$species == "Adelie",], aes(x=body_mass_g, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Adelie species")

p2 <- ggplot(penguins[penguins$species == "Gentoo",], aes(x=body_mass_g, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Gentoo species")

p3 <- ggplot(penguins[penguins$species == "Chinstrap",], aes(x=body_mass_g, fill=sex)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Chinstrap species")
grid.arrange(p1, p2, p3, nrow=3)

# In all three species the males are bigger
# regardin all the four morphometric variables

# Discrimating species between penguins of same sex must be easier

# Bill length
p1 <- ggplot(penguins, 
             aes(x=bill_length_mm, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("All Individuals")

p2 <- ggplot(penguins[penguins$sex == "male",], 
             aes(x=bill_length_mm, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Only Males")

p3 <- ggplot(penguins[penguins$sex == "female",], 
             aes(x=bill_length_mm, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Only Female")
grid.arrange(p1, p2, p3, nrow=3)

# Bill depth
p1 <- ggplot(penguins, 
             aes(x=bill_depth_mm, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("All Individuals")

p2 <- ggplot(penguins[penguins$sex == "male",], 
             aes(x=bill_depth_mm, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Only Males")

p3 <- ggplot(penguins[penguins$sex == "female",], 
             aes(x=bill_depth_mm, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Only Female")
grid.arrange(p1, p2, p3, nrow=3)

# Flipper length
p1 <- ggplot(penguins, 
             aes(x=flipper_length_mm, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("All Individuals")

p2 <- ggplot(penguins[penguins$sex == "male",], 
             aes(x=flipper_length_mm, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Only Males")

p3 <- ggplot(penguins[penguins$sex == "female",], 
             aes(x=flipper_length_mm, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Only Females")
grid.arrange(p1, p2, p3, nrow=3)

# Body mass
p1 <- ggplot(penguins, 
             aes(x=body_mass_g, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("All Individuals")

p2 <- ggplot(penguins[penguins$sex == "male",], 
             aes(x=body_mass_g, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Only Males")

p3 <- ggplot(penguins[penguins$sex == "female",], 
             aes(x=body_mass_g, fill=species)) +
  geom_density(alpha=0.6, position="identity") +
  ggtitle("Only Females")
grid.arrange(p1, p2, p3, nrow=3)

# The sex may not be as important as thought

# Visualizations using two variables at once -----------------------------------

plots <- c()
k <- 0
for (i in 1:4) {
  for (j in (i+1):4) {
    if (j < 5 & j > i) {
      k = k+1
      p = ggplot(penguins, aes_string(x=metric_cols[i], y=metric_cols[j], color="species", shape="species")) +
        geom_point(size=2)
      plots[[k]] = p
    }
  }
}

grid.arrange(grobs = plots, nrow=3)

# The scatterplots points that Gentoo individuals will be easier to discriminate
