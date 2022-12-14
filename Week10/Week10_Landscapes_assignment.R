# Load the packages from this week's tutorial.

setwd("C:/GitHub/kilgusmh/Week10")#still have directory issues.
install.packages("spdep")
library(spdep)
install.packages("adespatial")
library(adespatial)
install.packages("vegan")
library(vegan)

#In the tutorial we looked at the community as a whole and the swimmers which ultimately matched a prediction we had for their distribution.

#Part 1: Look at two other subsets of the community and determine the relative influence of space and habitat on each following the methods in the tutorial. (10 points)
#The options include groupings by taxonomy, where Diptera (true flies) have the strongest flight ability, Trichoptera the 2nd strongest, 
    #Ephememeroptera are 3rd, and non insects are 4th...because they don't have wings.
#Groupings by habits include the swimmers (off limits for the assignment) as most mobile, sprawlers as 2nd (they move in search of food, but not quickly),
    #and the clingers come in last (they might move up and down on individual rocks).

PatchLatLon.csv <- read.csv("PatchLatLon.csv", header=T)
Trichoptera.csv <- read.csv("Trichoptera.csv", header=T)
HabitatbyPatch.csv <- read.csv("HabitatbyPatch.csv", header=T)
Clingers.csv <- read.csv("Clingers.csv", header=T)

PatchLatLon.mat <- as.matrix(PatchLatLon.csv[,-1])
Trichoptera.mat <- as.matrix(Trichoptera.csv)
HabitatbyPatch.mat <- as.matrix(HabitatbyPatch.csv)
Clingers.mat <- as.matrix(Clingers.csv)

nb<-cell2nb(3,30,"queen") #three columns, 30 rows long, 90 nodes.
nb1 <- droplinks(nb, 19, sym=TRUE) #these drop specific values from the network based on missing data points.
nb2 <- droplinks(nb1, 22, sym=TRUE)
nb3 <- droplinks(nb2, 25, sym=TRUE)
nb4 <- droplinks(nb3, 30, sym=TRUE)

bin.mat <- aem.build.binary(nb4, PatchLatLon.mat, unit.angle = "degrees", rot.angle = 90, rm.same.y = TRUE, plot.connexions = TRUE)

plot(PatchLatLon.mat[,2]~PatchLatLon.mat[,3], xlim = rev(c(76.75,77)))
aem.ev <- aem(aem.build.binary=bin.mat)
aem.df <- aem.ev$vectors[c(-19,-22,-25,-30),]
aem.df

Space.rda <- rda(Trichoptera.mat, as.data.frame(aem.df))
Space.r2a <- RsquareAdj(Space.rda)$adj.r.squared

aem.fwd <- forward.sel(Trichoptera.mat,aem.df, adjR2thresh=Space.r2a)
aem.fwd$order

SpaceNoHab.rda <- rda(Trichoptera.mat, as.data.frame(aem.df[,aem.fwd$order]), HabitatbyPatch.mat)
SpaceNoHab.rda 
anova(SpaceNoHab.rda, perm.max = 10000)
RsquareAdj(SpaceNoHab.rda)


HabNoSpace.rda <- rda(Trichoptera.mat, HabitatbyPatch.mat, as.data.frame(aem.df[,aem.fwd$order]))
HabNoSpace.rda 
anova(HabNoSpace.rda, perm.max = 10000)
RsquareAdj(HabNoSpace.rda)

NonISpace.rda <- rda(Clingers.mat, as.data.frame(aem.df))
NonISpace.r2a <- RsquareAdj(NonISpace.rda)$adj.r.squared

NonIaem.fwd <- forward.sel(Clingers.mat,as.data.frame(aem.df), adjR2thresh=Space.r2a)


NonISpaceNoHab.rda <- rda(Clingers.mat, as.data.frame(aem.df[,NonIaem.fwd$order]), HabitatbyPatch.mat)
NonISpaceNoHab.rda 
anova(NonISpaceNoHab.rda, perm.max = 10000)
RsquareAdj(NonISpaceNoHab.rda)

NonIHabNoSpace.rda <- rda(Clingers.mat, HabitatbyPatch.mat, as.data.frame(aem.df[,NonIaem.fwd$order]))
NonIHabNoSpace.rda 
anova (NonIHabNoSpace.rda, perm.max = 10000)
RsquareAdj(NonIHabNoSpace.rda)



#Part 2: What is your interpretation of the pattern for each group individually, and the two in comparison, based on their mobility? (5 points)
#sPACENOHAB TRI 54.36 conditional 23.05 HABNOSPACE TRI 2.03 75.38 noninsectspacenohab clinger 49.75 25.82nonisencthabnospace clinger 4.30 71.27
#When Trichoptera have space, they is no significance, but with habitat, it is significant from constrained 2.03% and conditional 75.38%. Similarly, clingers have an no significant change to space, but significant habitat difference of 4.30% and 71.27%.Therefore, their mobility is the same for both Trichoptera and Clingers.
#What is the interpretation of these individually? Your numbers for space are also not correct based on your own analysis.




#Part 3: For each of your chosen groups of bugs, perform variable selection for the habitat data rather than the AEM data. Which habitat variables are significant for each? (10 points)
  # Definitions for the habitat column names:
    #Inorg = total suspended inorganic solids in the water column
    #Organ = total suspended organic solids in the water column
    #Chla = Chlorophyll a concentration from benthic rocks collected in-stream
    #BOM = total benthic organic matter in the sample
    #Depth = water depth
    #Flow	= water velocity where samples were collected
    #Fines = Percent of the substrate as "fines" i.e. small particles too small to measure
    #AveAr = The average size of rocks where each sample was collected

HabitatbyPatch.rda <- rda(Trichoptera.mat, as.data.frame(HabitatbyPatch.mat))
HabitatbyPatch.r2a <- RsquareAdj(HabitatbyPatch.rda)$adj.r.squared

HabitatbyPatch.fwd <- forward.sel(Trichoptera.mat,HabitatbyPatch.mat, adjR2thresh=Space.r2a)

#Depth is significant to the habitat variables.
HabitatbyPatch.fwd
#Where are clingers? This is only half of the question
#Part 4: How do you expect selecting both the spatial and the habitat variables would change the results of the RDAs from Part 1 above? (5 points)
  #(You do not need to redo the RDAs, unless you *want* to.)
#The habitat variables are more specific than spatial variables. Therefore, the results would be more clear and easily explained for habitat variables.
#This is not entirely true and not relevant to the question.
