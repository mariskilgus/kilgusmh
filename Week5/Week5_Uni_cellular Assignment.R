# First, recreate Figure 4 from Herron et al. (2019). De novo origins of multicellularity in response to predation. Scientific Reports.
# https://datadryad.org/stash/dataset/doi:10.5061%2Fdryad.53k345s
  # Search datadryad.org by the paper title and download the dataset. It will include .csv files and R scripts, organized by figure.
  # Save the script and change the working directory on lines 8 and 115 to match your GitHub repository. (6 points)
  # Export and save the plot you've created. (2 points)
  # Zoom into your plot to look at the distribution for different strains.

install.packages("fitdistrplus")
library(fitdistrplus)
install.packages("logspline")
library(logspline)
setwd("C:/GitHub/kilgusmh/Week 5")
data <- read.csv("Figure4Data.csv", header=TRUE)
data.frame("Figure4Data")
plot(data$~ data$Ara_plusAnc, xlab ="Ara+ Ancestor", ylab ="Ara+1", main = "Fig 1(c)" )

fig1c.mod <- lm(data$Ara_plus1Ev ~ data$Ara_plusAnc)
anova(fig1c.mod)
summary(fig1c.mod)
abline(fig1c.mod, col = "grey", lwd= 3)
nolog_data <- as.data.frame(10^data[,2:6])
plot(nolog_data$Ara_plus1Ev ~ nolog_data$Ara_plusAnc,
     xlab ="Ara+ Ancestor", ylab ="Ara+1", main = "Fig 1(c) not transformed" )
lim_nolog <- as.data.frame(nolog_data[(nolog_data$Ara_plus1Ev <= 0.02),])
lim_nolog <- as.data.frame(lim_nolog[(lim_nolog$Ara_plusAnc <= 0.02),])
plot(lim_nolog$Ara_plus1Ev ~ lim_nolog$Ara_plusAnc, 
     xlab ="Ara+ Ancestor", ylab ="Ara+1", main = "Fig 1(c) not transformed, no outliers" )
fig1c.mod2 <- lm(nolog_data$Ara_plus1Ev ~ nolog_data$Ara_plusAnc)
anova(fig1c.mod2)
summary(fig1c.mod2)
fig1c.mod3 <- lm(lim_nolog$Ara_plus1Ev ~ lim_nolog$Ara_plusAnc)
anova(fig1c.mod3)
summary(fig1c.mod3)
plot(lim_nolog$Ara_plus1Ev ~ lim_nolog$Ara_plusAnc, 
     xlab ="Ara+ Ancestor", ylab ="Ara+1", main = "Fig 1(c) not transformed, no outliers" )
abline(fig1c.mod3, col = "grey", lwd= 3)
plot(lim_nolog$Ara_plus1Ev ~ lim_nolog$Ara_plusAnc, 
     xlab ="Ara+ Ancestor", ylab ="Ara+1", main = "Fig 1(c) not transformed, no outliers", 
     xlim = c(0,0.0015), ylim= c(0,0.0015))
abline(fig1c.mod3, col = "grey", lwd= 3)
one.col <- lim_nolog$Ara_plusAnc #All we need to do is change the vector to re-run.
hist(one.col, main = "Ancestor")
fit.norm <- fitdist(one.col, distr = "norm")
fit.norm <- fitdist(one.col*100, distr = "norm")
fit.logis <- fitdist(one.col*100, distr = "logis")
fit.weibull <- fitdist(one.col*100, distr = "weibull", lower = c(0, 0), start = list(scale = 1, shape = 1))
fit.gamma <- fitdist(one.col*100, distr = "gamma", lower = c(0, 0), start = list(scale = 1, shape = 1))
gofstat(list(fit.weibull, fit.gamma, fit.norm, fit.logis))
fit.weibull <- fitdist(one.col, distr = "weibull", lower = c(0, 0), start = list(scale = 1, shape = 1))
fit.gamma <- fitdist(one.col, distr = "gamma", lower = c(0, 0), start = list(scale = 1, shape = 1))
gofstat(list(fit.weibull, fit.gamma))
one.col <- lim_nolog$Ara_plus1Ev
hist(one.col, main = "Evolved")
fit.norm <- fitdist(one.col*100, distr = "norm")
fit.logis <- fitdist(one.col*100, distr = "logis")
fit.weibull <- fitdist(one.col*100, distr = "weibull", lower = c(0, 0), start = list(scale = 1, shape = 1))
fit.gamma <- fitdist(one.col*100, distr = "gamma", lower = c(0, 0), start = list(scale = 1, shape = 1))
gofstat(list(fit.norm, fit.logis, fit.weibull, fit.gamma))

# Do all of the strains in the plot have the same distributions (yes/no)? (2 pt)


# Based on these observations of your strain distributions, why did the authors use a Kruskal-Wallis test rather than ANOVA to compare the strains? (2 pts)


# Use the fitdist() and gofstat() functions to compare the poisson, negative binomial, and logistic distributions for:
  # (1) - The number of cells of progeny (data$Num.Cells.Progeny)
  # (2) - The replication time (data$RepTime.sec)
      # 3 points each
    #HINT- "Num.Cells.Progeny" has defined breaks. To display results, use the formula with the "chisqbreaks" argument as follows:
      #gofstat(list(fit.1, fit.2, fit.3, etc), chisqbreaks=c(1,2,4,8,16,32,64))


# Based on the AIC scores, which distribution is the best fit for: (4 pts)
  # (1) - The number of cells of progeny (data$Num.Cells.Progeny)?
  # (2) - The replication time (data$RepTime.sec)?


# Plot a generic histogram for the replication time (data$RepTime.sec) (2 pt)

# Based on the patterns of this histograms and Figure 4:
  #Give one hypothesis for an evolutionary process represented by the two tallest bars in your histogram. (6 pts)
  # Don't cheat by looking at the paper! 
    # This hypothesis does not need to be correct - it only needs to be ecologically rational based these two figures.








