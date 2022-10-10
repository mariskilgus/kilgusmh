# First, recreate Figure 4 from Herron et al. (2019). De novo origins of multicellularity in response to predation. Scientific Reports.
# https://datadryad.org/stash/dataset/doi:10.5061%2Fdryad.53k345s
  # Search datadryad.org by the paper title and download the dataset. It will include .csv files and R scripts, organized by figure.
  # Save the script and change the working directory on lines 8 and 115 to match your GitHub repository. (6 points)
  # Export and save the plot you've created. (2 points)
  # Zoom into your plot to look at the distribution for different strains.
#The figure you exported is blank. Make sure you check files after creating them.

install.packages("fitdistrplus")
library(fitdistrplus)
install.packages("logspline")
library(logspline)
setwd("C:/Users/Kilgus/Documents/GitHub/kilgusmh/Week5/data5")
data <- read.csv("Figure4Data.csv", header=TRUE)
data.frame("Figure4Data")
plot(data$ClusterID)
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("reshape2")
library(reshape2)
data <- read.csv(file=("c:/Users/Kilgus/Documents/GitHub/kilgusmh/Week5/data5/Figure4Data.csv"), header=T)
data.new <- data.frame(data[1:4])
data.new$freq <- data.new$Num.Cells.Progeny
data.new <- na.omit(data.new)
data.weight <- data.new[rep(row.names(data.new), data.new$freq), 1:4]
data.weight$log.progeny <- log(data.weight$Num.Cells.Progeny, 2)
means.progeny <- aggregate(data.weight$Num.Cells.Progeny ~ data.weight$Strain, FUN = mean)
sd.progeny <- aggregate(data.weight$Num.Cells.Progeny ~ data.weight$Strain, FUN = sd)
colnames(means.progeny) <- c("Strain","Mean.Num.Progeny")
colnames(sd.progeny) <- c("Strain","SD.Num.Progeny")
data.weight <- inner_join(data.weight,means.progeny, by = "Strain")
data.weight <- inner_join(data.weight,sd.progeny, by = "Strain")
data.new$log.progeny <- log(data.new$Num.Cells.Progeny, 2)
samplesizes <- summary(data.new$Strain)
samplesizes
data.weight$Strain <- factor(data.weight$Strain, levels = c('K101','K106','B506','B210','B201','B505','B211','B203','B204'))
data.new$Strain <- factor(data.new$Strain, levels = c('K101','K106','B506','B210','B201','B505','B211','B203','B204'))

ggsave(filename=paste("c:/Users/Kilgus/Documents/GitHub/kilgusmh/Week5/data5/Figure4",paste("Figure4", ".png", sep=""), sep=""), plot=myplot,
       width = 10, height = 4, bg = 'transparent')
myplot <- ggplot(data = data.weight,aes(x=Strain,y=log.progeny))

geom_boxplot(size = 1.2)
geom_jitter(data = data.new,
              aes(x=factor(Strain),
                  y=log.progeny),
              size = 0.7, alpha = 0.3, color = 'green4', fill = 'green4')
theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.background = element_rect(fill = "transparent", colour = NA),
        panel.background = element_rect(fill = "transparent"),
        axis.line = element_line(colour = 'black'),
        text = element_text(size=20),
        axis.text.x = element_text(color = 'black'),
        axis.text.y = element_text(color = 'black'))
scale_y_continuous(limits=c(-0.5,6))
scale_x_discrete(labels = c('K101','K106',
                              'B506','B210',
                              'B201','B505',
                              'B211','B203',
                              'B204'))
labs(x="Strain", y=expression("Cells per Propagule (Log"[2]*")"))
annotate('text', x=1, y=-0.5, label="N = 668") 
annotate('text', x=2, y=-0.5, label="162")
annotate('text', x=3, y=-0.5, label="162")
annotate('text', x=4, y=-0.5, label="158")
annotate('text', x=5, y=-0.5, label="119")
annotate('text', x=6, y=-0.5, label="704")
annotate('text', x=7, y=-0.5, label="51")
annotate('text', x=8, y=-0.5, label="115")
annotate('text', x=9, y=-0.5, label="103")
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


# Do all of the strains in the plot have the same distributions (yes/no)? (2 pt)
#Where is the answer to this question?

# Based on these observations of your strain distributions, why did the authors use a Kruskal-Wallis test rather than ANOVA to compare the strains? (2 pts)


# Use the fitdist() and gofstat() functions to compare the poisson, negative binomial, and logistic distributions for:
  # (1) - The number of cells of progeny (data$Num.Cells.Progeny)
  # (2) - The replication time (data$RepTime.sec)
      # 3 points each
    #HINT- "Num.Cells.Progeny" has defined breaks. To display results, use the formula with the "chisqbreaks" argument as follows:
      #gofstat(list(fit.1, fit.2, fit.3, etc), chisqbreaks=c(1,2,4,8,16,32,64))
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


# Based on the AIC scores, which distribution is the best fit for: (4 pts)
  # (1) - The number of cells of progeny (data$Num.Cells.Progeny)?
  # (2) - The replication time (data$RepTime.sec)?


# Plot a generic histogram for the replication time (data$RepTime.sec) (2 pt)

# Based on the patterns of this histograms and Figure 4:
  #Give one hypothesis for an evolutionary process represented by the two tallest bars in your histogram. (6 pts)
  # Don't cheat by looking at the paper! 
    # This hypothesis does not need to be correct - it only needs to be ecologically rational based these two figures.


#You didn't answer the questions or create this histogram at the end!





