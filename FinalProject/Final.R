#Download excel sheets from both Dryad links below
#https://datadryad.org/stash/dataset/doi:10.5061%2Fdryad.6bs01
#https://datadryad.org/stash/dataset/doi:10.5061%2Fdryad.t7f3rc8
#Question: How do antibiotics effect greenhouse emissions from cows?
#Goals:Boxplot of each gas of treatments for each experiment showing ANOVA, and	Scatter plot of significant gas flux, and independent gas flux showing linear regression.

setwd("C:/GitHub/kilgusmh/FinalProject")#Working directory is wrong.
install.packages("vegan")
library(vegan)

beetlegas.csv <- read.csv("beetlegas.csv", header=T)
cowgas.csv <- read.csv("cowgas.csv", header=T)

#Combines the rows of two differnt excel sheets to make into one dataframe
data <- rbind(beetlegas.csv,cowgas.csv)

#Separate each gas (CO2,CH4,N2O) to create a boxplot and ANOVA summary for each gas
#First CO2
boxplot(data$FluxCO2~data$treatment) 
boxplot(data$FluxCO2~data$treatment, xlab = "Treatment", ylab = "CO2 Flux", main = "Antibiotic Effects on CO2 Flux",
        cex.axis=1, cex.main = 1.5, cex.lab = 1.15, pch=17, col = "red", cex = 1.5)

modCO2 <- lm(data$FluxCO2 ~ data$treatment)
anova(modCO2)
summary(modCO2)

#Second CH4
boxplot(data$FluxCH4~data$treatment)
modCH4 <- lm(data$FluxCH4 ~ data$treatment)
anova(modCH4)
summary(modCH4)

#Third N2O
boxplot(data$FluxN2O~data$treatment, ylim = c(-5, 5))

boxplot(data$FluxN2O~data$treatment, xlab = "Treatment", ylab = "N2O Flux", main = "Antibiotic Effects on N2O Flux",
        cex.axis=1, cex.main = 1.5, cex.lab = 1.15, pch=17, col = "blue", cex = 1.5, ylim = c(-5, 5))
modN2O <- lm(data$FluxN2O ~ data$treatment)
anova(modN2O)
summary(modN2O)
#The most drastically different gases (using p-value), should be used in the linear regression

#Since N2O has small flux and not significant p-value compared to CO2, N2O is the independent value for linear regression.

plot(data$FluxCO2)
#Separate Antibiotic from control by creating a new dataframe
Antibiotic <- subset(data, treatment== "Antibiotic")
plot(Control$FluxCO2)
#Separate control from Antibiotic by creating a new dataframe
Control <- subset(data, treatment== "Control")
#What are these subsets and plots for?
#Create scatter plot of the relationship between CO2 and N2O
plot(data$FluxCO2 ~ data$FluxN2O, xlim = c(0, 3.5))
plot(data$FluxCO2 ~ data$FluxN2O,xlim = c(0, 3.5), ylim = c(0, 45000), xlab = "N2O Flux", ylab = "CO2 Flux", main = "Relationship of Gas Fluxes",
        cex.axis=1, cex.main = 1.5, cex.lab = 1.15, pch=17, col = "green", cex = 1.5)

#Create a summary to have stats like t-value
FluxCO2.lm <- lm(data$FluxCO2 ~ data$FluxN2O)

summary(FluxCO2.lm)
#Why didn't you run this model including flux and treatment like we talked about? 

#Save each graph to the Final Project folder for the results report.