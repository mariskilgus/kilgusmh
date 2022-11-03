# Load the packages from this week's tutorial.

setwd("C:/Users/kilgus/Documents/GitHub/kilgusmh/Week10")
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
NonInsects.csv <- read.csv("NonInsects.csv", header=T)

PatchLatLon.mat <- as.matrix(PatchLatLon.csv[,-1])
Trichoptera.mat <- as.matrix(Trichoptera.csv)
HabitatbyPatch.mat <- as.matrix(HabitatbyPatch.csv)
NonInsects.mat <- as.matrix(NonInsects.csv)

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

SpaceNoEph.rda <- rda(Trichoptera.mat, as.data.frame(aem.df[,aem.fwd$order]), HabitatbyPatch.mat)
SpaceNoEph.rda 
anova(SpaceNoHab.rda, perm.max = 10000)
RsquareAdj(SpaceNoEph.rda)


EphNoSpace.rda <- rda(Trichoptera.mat, Ephemeroptera.mat, as.data.frame(aem.df[,aem.fwd$order]))
EphNoSpace.rda 
anova(EphNoSpace.rda, perm.max = 10000)
RsquareAdj(EphNoSpace.rda)

NonISpace.rda <- rda(NonInsects.mat, as.data.frame(aem.df))
NonISpace.r2a <- RsquareAdj(NonISpace.rda)$adj.r.squared

NonIaem.fwd <- forward.sel(NonInsects.mat,as.data.frame(aem.df), adjR2thresh=Space.r2a)


NonISpaceNoHab.rda <- rda(NonInsects.mat, as.data.frame(aem.df[,NonIaem.fwd$order]), Ephemeroptera.mat)
NonISpaceNoHab.rda 
anova(NonISpaceNoEph.rda, perm.max = 10000)
RsquareAdj(NonISpaceNoEph.rda)

NonIEphNoSpace.rda <- rda(NonInsects.mat, Ephemeroptera.mat, as.data.frame(aem.df[,NonIaem.fwd$order]))
NonIEphNoSpace.rda 
anova (NonIEphNoSpace.rda, perm.max = 10000)
RsquareAdj(NonIEphNoSpace.rda)



#Part 2: What is your interpretation of the pattern for each group individually, and the two in comparison, based on their mobility? (5 points)


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


#Part 4: How do you expect selecting both the spatial and the habitat variables would change the results of the RDAs from Part 1 above? (5 points)
  #(You do not need to redo the RDAs, unless you *want* to.)