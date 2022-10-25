# For this week it's time to start exploring your own ideas and questions in R.
  # There are at least five options in the dataset to create the following comparisons.Abiotic

# (Q1 - 12 pts) Use the dataset from the tutorial to complete one redundancy analysis (RDA) with variance partitioning on a different community (NOT the nematodes).
#Abiotic v invertebrate community,not soil plants.

install.packages("readx1")
library(readxl)

setwd("C:/Users/kilgus/Documents/GitHub/kilgusmh/Week9")
abiotic.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Abiotic factors")
abiotic <- as.data.frame(abiotic.tibble)

head(abiotic)
boxplot(pH ~ Site, data= abiotic, main = "pH by Site")
boxplot(pH ~ Land_Use, data= abiotic, main = "pH by Land Use")

boxplot(Kalium ~ Site, data= abiotic, main = "K by Site")
boxplot(Kalium ~ Land_Use, data= abiotic, main = "K by Land Use")

boxplot(totalN ~ Site, data= abiotic, main = "N by Site")
boxplot(totalN ~ Land_Use, data= abiotic, main = "N by Land Use")

nema.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Invertebrate_community")
nema <- as.data.frame(nema.tibble)
head(inver)
abiotic.names <- paste(abiotic$Site, abiotic$Land_Use, abiotic$Plot)
abiotic$names <- abiotic.names

head(abiotic)


  # Explain the ecological importance of your significant predictor variables, or the importance if none are significant for your community.
#

# (Q2 - 12 pts) Then use the dataset from the tutorial to create a linear model related to your RDA. Try multiple predictors to find the best fit model.

  # Explain the ecological importance of the significant predictors, or lack of significant predictors.
#

# (Q3 - 6 pts) Provide a 3-4 sentence synthesis of how these results relate to one another and the value of considering both together for interpreting biotic-abiotic interactions.
#

