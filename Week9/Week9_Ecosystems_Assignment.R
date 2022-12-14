# For this week it's time to start exploring your own ideas and questions in R.
  # There are at least five options in the dataset to create the following comparisons.Abiotic

# (Q1 - 12 pts) Use the dataset from the tutorial to complete one redundancy analysis (RDA) with variance partitioning on a different community (NOT the nematodes).
#Abiotic v invertebrate community,not soil plants.

install.packages("readxl")
library("readxl")


setwd("C:/Users/kilgus/Documents/GitHub/kilgusmh/Week9")#This is not where the working directory should point.
setwd("C:/GitHub/kilgusmh/Week9")
abiotic.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Abiotic factors")

abiotic <- as.data.frame(abiotic.tibble)

head(abiotic)
boxplot(pH ~ Site, data= abiotic, main = "pH by Site")
boxplot(pH ~ Land_Use, data= abiotic, main = "pH by Land Use")

boxplot(Kalium ~ Site, data= abiotic, main = "K by Site")
boxplot(Kalium ~ Land_Use, data= abiotic, main = "K by Land Use")

boxplot(totalN ~ Site, data= abiotic, main = "N by Site")
boxplot(totalN ~ Land_Use, data= abiotic, main = "N by Land Use")



inver.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Invertebrate_community")
inver <- as.data.frame(inver.tibble)
head(inver)

abiotic.names <- paste(abiotic$Parcel, abiotic$Land_Use)
abiotic$names <- abiotic.names

head(abiotic)


inver.names <- paste(inver$Parcel, inver$Landuse)
inver$names <- inver.names

abiotic.means <- aggregate(x = abiotic, by = list(abiotic$names), FUN = "mean")

head(abiotic.means)

inver.means <- aggregate(x = inver, by = list(inver$names), FUN = "mean")

head(inver.means)

abiotic.means1 <- abiotic.means[,-16] # NA column
abiotic.means2 <- abiotic.means1[,-1:-6] # Plot and NA columns
abiotic.means2 <- sapply(abiotic.means2, as.numeric ) # Make sure everything is numeric.
abiotic.means2 <- as.data.frame(abiotic.means2)

inver.means1 <- inver.means[,-41] # Remove NAs
inver.means2 <- as.data.frame(inver.means1[,-1:-4]) # Remove plot and NAs
inver.means2 <- sapply(inver.means2, as.numeric )
inver.means3 <- as.data.frame(inver.means2[-20,-68])
install.packages("vegan")
library(vegan)
ord <- rda(inver.means2[-20,-68] ~ pH + totalN + Perc_ash + Kalium + Magnesium + Ca + Al + TotalP + OlsenP, abiotic.means2)
ord
#ncol(inver.means2)
anova(ord)  

plot(ord, ylim = c(-2,2), xlim = c(-5,5))  

ord <- rda(inver.means2[-20,-68] ~., abiotic.means2) 
ord.int <- rda(inver.means2[-20,-68] ~1, abiotic.means2)

step.mod <- ordistep(ord.int, scope = formula(ord), selection = "both")
step.mod$anova

step.R2mod <- ordiR2step(ord.int, scope = formula(ord), selection = "forward")

ord2 <- rda(inver.means2[-20,-68] ~ totalN, abiotic.means2)
ord2
anova(ord2)
plot(ord2)



  # Explain the ecological importance of your significant predictor variables, or the importance if none are significant for your community.
#Out of all the box plots, the pH by site for almoeseniebos..muizenbos is the most significant predictor variable because there is the most amount of difference between the three sites.The pH lowered or raised can alter the amount and type of vegetation growing. Thus, creating different types of food in different places/sites.
#This has nothing to do with the RDA. From your code, only total nitrogen is a significant predictor of the community, so your answer should have been about nitrogen.

# (Q2 - 12 pts) Then use the dataset from the tutorial to create a linear model related to your RDA. Try multiple predictors to find the best fit model.
# And we can FINALLY compare the abiotic data against the biotic communities:



library(fitdistrplus)
library(logspline)

colnames(inver)

mod1 <- lm(inver.means3$Aranae ~ abiotic.means2$pH)
summary(mod1)
anova(mod1)
AIC(mod1)

summary(mod1)$adj.r.squared

mod2 <- lm(inver.means3$Aranae ~ abiotic.means2$pH + abiotic.means2$totalN + abiotic.means2$Kalium)
summary(mod2)
anova(mod2)
AIC(mod1,mod2)

plot(mod2$residuals)

summary(mod2)$adj.r.squared
mod3 <- lm(inver.means3$Aranae ~ abiotic.means2$pH + abiotic.means2$totalN)
summary(mod3)
anova(mod3)
AIC(mod2, mod3)
plot(mod3$residuals)
summary(mod3)$adj.r.squared

mod4 <- lm(inver.means3$Aranae ~ abiotic.means2$pH*abiotic.means2$totalN*abiotic.means2$Kalium)
summary(mod4)
anova(mod4)
AIC(mod2,mod3,mod4)
plot(mod4$residuals)
summary(mod4)$adj.r.squared

mod5 <- lm(inver.means3$Aranae ~ abiotic.means2$pH + abiotic.means2$Kalium + abiotic.means2$totalN)
summary(mod5)
anova(mod5)
AIC(mod2,mod3,mod4,mod5)
plot(mod5$residuals)
summary(mod5)$adj.r.squared

mod6 <- lm(inver.means3$Aranae ~ abiotic.means2$Kalium + abiotic.means2$pH*abiotic.means2$totalN)
summary(mod6)
anova(mod6)
AIC(mod2,mod3,mod4,mod5,mod6)
plot(mod6$residuals)
summary(mod6)$adj.r.squared#yay, it worked!


  # Explain the ecological importance of the significant predictors, or lack of significant predictors.
#Nitrogen is significant to the soil and what vegetation can grow.

# (Q3 - 6 pts) Provide a 3-4 sentence synthesis of how these results relate to one another and the value of considering both together for interpreting biotic-abiotic interactions.
#Nitrogen is significant to invertebrate communities because if nitrogen affects the soil, there could be less vegetation. 
#This causes a lack of food for invertebrates. Additionally, with a significant addition of nitrogen in a water sources could potentially kill invertebrates.
#Thus, reducing the population and changing the entire ecosystem.
#Increased nitrogen generally causes increased plant growth. Otherwise this is in the right direction.
