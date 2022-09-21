# Approximately how many hours ahead of Sunbury was the peak flow in Lewisburg during the 2011 flood? (1 pt)
About 9 hours (accept 7-11 hours)

# Give one reason why information on the time between peak flow events up- and downstream could be valuable information? (3 pts)
So Sunbury had more time to prepare for the high amount of flow to avoid destruction. #How/why do they have MORE time?

# Package scavenger hunt! (8 pts each)

## 1) Using Google and ONLY packages from GitHub or CRAN:
# Find a package that contains at least one function specifically designed to measure genetic drift.
https://cran.r-project.org/web/packages/learnPopGen/learnPopGen.pdf
#Where is your code for the library?
# Copy-paste into your script - and run - an example from the reference manual for a function within this package related to a measure of genetic drift. 
drift.selection
drift.selection(p0=0.5, Ne=100, w=c(1,1,1), ngen=400, nrep=10, color=pink)#This does not run.

# Depending on the function, either upload a plot of the result or use print() and copy/paste the console output into your script.

# After running the function example, manipulate a parameter within the function to create a new result. 
# Common options might be allele frequency, population size, fitness level, etc. 
msd(p0=c(0.5,0.5), Ne=c(100,100), w=list(c(1,1,1),c(1,1,1)),
    m=c(0.01,0.01), ngen=400, colors=c("red","blue"))#This is a different function...

# Add the results of this manipulation to your script (if in the console) or upload the new plot.

# By manipulating these parameters you can see how it impacts the results.
# This type of manipulation is one example of how theoretical ecology and modelling are used to predict patterns in nature.



## 2) Using Google and ONLY packages from GitHub or CRAN:
# Find a package that will generate standard diversity metrics for community ecology, specifically Simpson's Diversity Index.
https://cran.r-project.org/web/packages/BiodiversityR/BiodiversityR.pdf
#Where is the call to the library?
# Copy-paste into your script - and run - an example from the reference manual for a function to calculate Simpson's diversity. 
# Depending on the example usage of the function, either upload a plot of the result or use print() and copy/paste the console output into your script.
data(dune.env)
dune.env2 <- dune.env[,c('A1', 'Moisture', 'Manure')]
dune.env2$Moisture <- as.numeric(dune.env2$Moisture)
dune.env2$Manure <- as.numeric(dune.env2$Manure)
sol <- bioenv(dune ~ A1 + Moisture + Manure, dune.env2)#This does not run the way you have setup your code.
sol
summary(sol)
dune.env3 <- prepare.bioenv(dune.env, as.numeric=c('Moisture', 'Manure'))#Function does not work.
bioenv(dune, dune.env3)


# After running the function example, modify your script to generate another diversity metric that is NOT part of the example. 
dune.env2 <- dune.env[,c('B4', 'Oasis', 'Dry')]

# If there are two diversity metrics in the example script, neither of these will count as the modified script.
# Hint: If the function can "only" caluclate Simpson's diversity, the inverse of Simpson's diversity is another common metric. 
# Add the results of this manipulation to your script (if in the console) or upload the new plot.
dune.env3 <- prepare.bioenv(dune.env, as.numeric=c('Oasis', 'Dry'))
bioenv(dune, dune.env3)

# Diversity metrics are frequently used in community ecology for reasons ranging from a quick comparison between sites to understanding community stability.
# Their calculation can be very tedious by hand - and very fast with a package designed for the operation.

#Where are the exported plots and outputs of your diversity measures? They are not saved to GitHub or here in your script...


