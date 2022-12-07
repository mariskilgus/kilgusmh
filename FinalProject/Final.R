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


mergedf <- merge(beetlegas.csv,cowgas.csv,bF "row", All=T) 







plot(beetlegas.csv)
plot(cowgas.csv)


