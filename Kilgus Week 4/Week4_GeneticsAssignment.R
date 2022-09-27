# What happens to the maximum parsimony calculation when you move a node in the unrooted tree from this week's exercise? (4 points)
  # Use the term "similarity matrix" in your answer.
  # Hint: Why does it take longer to calculate than the original tree, and even more so if you move the point further?

# The maximum likelihood takes longer to calculate because you use the similarity matrix to pre-cluster a lot of clusters to move the point further.

# For your scripting assignment we will use the "ge_data" data frame found in the "stability" package.
  # Install the "stability" package, load it into your R environment, and use the data() function to load the "ge_data". 

install.packages("stability")
data.frame("ge_data")

# Create two linear models for Yield Response: one related to the Environment and one to the Genotype.
  # 'Yield Response' in this dataset is a measure of phenotype expression.
  # Hint: Look at the help file for this dataset.

install.packages(c("poppr", "mmod", "magrittr", "treemap"), repos = "http://cran.rstudio.com", dependencies = TRUE)
library(poppr)
data(monpop)
splitStrata(monpop) <- ~Tree/Year/Symptom
setPop(monpop) <- ~Symptom
monpop$tab
head(monpop$tab)
nrow(monpop$tab)
ncol(monpop$tab)
library("vegan")
gene.simp <- diversity(monpop$tab, index="simpson")
mean(gene.simp, na.rm = TRUE)
gene.shan <- diversity(monpop$tab, index="shannon")
mean(gene.shan, na.rm = TRUE)
poppr(monpop)
mon.tab <- mlg.table(monpop)
hist.tab <- t(mon.tab)
hist(hist.tab[,1], breaks = 25, main = "BB")
hist(hist.tab[,2], breaks = 25, main = "FR")
install.packages("haplotypes")
library(haplotypes)
data("dna.obj")
x<-dna.obj
p<-parsimnet(x)
plot(p)
plot(p, interactive=TRUE)
data <- read.csv("Dryad_data.csv")
head(data)
mod.lon <- lm(data$epi3~data$UTM.X..huso.30.)
anova(mod.lon)
summary(mod.lon)
mod.lat <- lm(data$epi3~data$UTM.Y..huso.30.)
anova(mod.lat)
summary(mod.lat)
mod.latlon <- lm(data$epi3 ~ data$UTM.Y..huso.30. * data$UTM.X..huso.30.)
anova(mod.latlon)
summary(mod.latlon)
plot(data$UTM.Y..huso.30. ~ data$UTM.X..huso.30.)
mod.fac <- lm(data$epi3~data$Region)
anova(mod.fac)
summary(mod.fac)

# Test the significance of both models and look at the model summary.
  # Which model is a better fit to explain the yield response, and WHY? (4 points)
# Hint: Does one model seem more likely to be over-fitted?

#The genotype is the better fit because the significant codes show the relationship, whereas the environment does not. Although, the environment latitude and longitude separately have a significant intercept that is not zero, there is no relationship until put together, but the result is still weak.Therefore, the environment is overfitted.


# Which environment would be your very WORST choice for generating a strong yeild response? (2 points)
#Rapid City, South Dakota because the weather is constantly changing and never stable enough to acquire a strong yield response.