#Dryad link https://datadryad.org/stash/dataset/doi:10.5061%2Fdryad.t7f3rc8
#Question: How do antibiotics effect greenhouse emissions from cows?
#Boxplot of averages of control treatment for each experiment,Boxplot of averages after treatment for each experiment,	Scatter plot of averages of control treatment and averages after treatment for each experiment together (showing Bray-Curtis).


setwd("C:/Users/kilgus/Documents/GitHub/kilgusmh/FinalProject")
install.packages("spdep")
library(spdep)
install.packages("adespatial")
library(adespatial)
install.packages("vegan")
library(vegan)

beetlegas.csv <- read.csv("beetlegas.csv", header=T)
cowgas.csv <- read.csv("cowgas.csv", header=T)


data <- rbind(beetlegas.csv,cowgas.csv)


boxplot(data$FluxCO2~data$treatment)
boxplot(data$FluxCH4~data$treatment)
boxplot(data$FluxN2O~data$treatment)
boxplot(data$FluxCO2~data$treatment, xlab = "Treatment", ylab = "Flux", main = "Antibiotic Effects on Flux", 
     cex.axis=1, cex.main = 1.5, cex.lab = 1.15, pch=17, col = "red", cex = 1.5)



summary(2:5)
t.test(2:5)


hist(2:3)
barplot(data$FluxCO2~data$treatment)
plot(data$FluxCO2~data$treatment)






