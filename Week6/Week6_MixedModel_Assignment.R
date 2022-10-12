# Read in the "Toscano_Griffen_Data.csv" data from GitHub and load the three packages we used in the tutorial this week.
# The paper these data came from is uploaded to Canvas as "Toscano&Griffen_2014_JAE..."


# First create models with the same (y) and method (GLMM) as the published paper, using the GLMM function from the tutorial. 
  #Create two different models using the same 3 predictor (x) variables from the dataset. (4 points each) 
    # In one model only include additive effects.
    # In the other model include one interactive effect.
    # Use a binomial distribution and block as a random effect in both models to match the paper's analyses. Remember ?family to find distribution names.

setwd("C:/GitHub/kilgusmh/Week6")

df <- read.csv("Toscano_Griffen_Data.csv")
install.packages("MASS")
library(MASS)
install.packages("MuMIn")
library(MuMIn)
df
# The authors used proportional consumption of prey as the (y) in their model, but did not include this in the dataset.
# So we are going to create it - run the following line, assuming df= your data frame (feel free to change that):
df$prop.cons <- df$eaten/df$prey 

glmm.mod <- glmmPQL(prop.cons ~ activity.level + carapace.width + claw.width, family = gaussian, random = ~ 1 | block, data = df)

glmm.mod2 <- glmmPQL(prop.cons ~ activity.level * carapace.width * claw.width, family = gaussian, random = ~ 1 | block, data = df)

dist1 <- glmmPQL(prop.cons ~ activity.level + carapace.width + claw.width, family = binomial, random = ~ 1 | block, data = df)

dist2 <- glmmPQL(prop.cons ~ activity.level * carapace.width * claw.width, family = binomial, random = ~ 1 | block, data = df)

plot(glmm.mod)
plot(glmm.mod2)
plot(dist1)
plot(dist2)

# (Q1) - The code in line 21 is performing two operations at once. What are they? (2 pts)
#It is comparing eaten and prey. Also, it shows the the proportion consumed of the prey ate.

# (Q2) - Did the interactive effect change which variables predict proportional consumption? How, specifically, did the results change? (5 pts)
summary(dist1)
summary(dist2)
#The carapace width determines more than the claw width at predicting the consumption.There were negative results for claw width.

# (Q3) - Plot the residuals of both models. Do you think either model is a good fit? Why or why not? (3 pts)
#gllm.mod1 is the best fit for the model because there is a higher amount of residuals at a lower fitted value.

# Re-run both models as generalized additive models instead (using gam). Then compare the AIC of both models. (4 points each)
gam.mod1 <- glmmPQL(prop.cons ~ activity.level + carapace.width + claw.width, family = gaussian, random = ~ 1 | block, data = df)
gam.mod2 <- glmmPQL(prop.cons ~ activity.level * carapace.width * claw.width, family = gaussian, random = ~ 1 | block, data = df)
AIC(gam.mod1, gam.mod2)


# (Q4) - Which model is a better fit? (2 pt)
#gam.mod1

# (Q5) - Based on the residuals of your generalized additive models, how confident are you in these results? (2 pts)
#Somewhat confident since I randomly picked two physical changes that could effect the prediction of the consumption.







