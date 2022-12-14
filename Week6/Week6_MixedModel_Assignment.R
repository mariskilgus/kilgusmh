# Read in the "Toscano_Griffen_Data.csv" data from GitHub and load the three packages we used in the tutorial this week.
# The paper these data came from is uploaded to Canvas as "Toscano&Griffen_2014_JAE..."


# First create models with the same (y) and method (GLMM) as the published paper, using the GLMM function from the tutorial. 
  #Create two different models using the same 3 predictor (x) variables from the dataset. (4 points each) 
    # In one model only include additive effects.
    # In the other model include one interactive effect.
    # Use a binomial distribution and block as a random effect in both models to match the paper's analyses. Remember ?family to find distribution names.

<<<<<<< HEAD

setwd("C:/Users/Kilgus/Documents/GitHub/kilgusmh/Week6")
=======
setwd("C:/GitHub/kilgusmh/Week6")
>>>>>>> fa4c085086048e9a89da6ea1b502ff089cd148a6

df <- read.csv("Toscano_Griffen_Data.csv")
install.packages("MASS")
library(MASS)
install.packages("MuMIn")
library(MuMIn)
<<<<<<< HEAD

glmm.mod <- glmmPQL(Flight.initiation.distance..FID.~Object, family = gaussian, random = ~ 1 | ID, data = df)
summary(glmm.mod)

r.squaredGLMM(glmm.mod)
glmm.mod2 <- glmmPQL(Flight.initiation.distance..FID.~Object + Area, family = gaussian, random = ~ 1 | ID, data = df)
summary(glmm.mod2)
r.squaredGLMM(glmm.mod2)
plot(glmm.mod2)
hist(df$Flight.initiation.distance..FID.)
glmm.mod3 <- glmmPQL(Flight.initiation.distance..FID.~Object + Area, family = Gamma, random = ~ 1 | ID, data = df)
plot(glmm.mod3)
summary(glmm.mod3)
r.squaredGLMM(glmm.mod3)
install.packages("mgcv")
library(mgcv)
gam.mod1 <- gam(Flight.initiation.distance..FID.~Object + Area, family = Gamma, random = list(ID=~ 1), data = df)
summary(gam.mod1)
plot(gam.mod1$residuals, ylim = c(-.1,.1))
vis.gam(gam.mod1, view=c("Object","Area"), theta = 45, color = "heat")
AIC(gam.mod1) 
gam.mod2 <- gam(Flight.initiation.distance..FID.~ Object*Area, family = Gamma, random = list(ID=~ 1), data = df)
summary(gam.mod2)
plot(gam.mod2$residuals, ylim = c(-.1,.1))

# The authors used proportional consumption of prey as the (y) in their model, but did not include this in the dataset.
  # So we are going to create it - run the following line, assuming df= your data frame (feel free to change that):
df$prop.cons <- df$eaten/df$prey 

# (Q1) - The code in line 8 is performing two operations at once. What are they? (2 pts)


# (Q2) - Did the interactive effect change which variables predict proportional consumption? How, specifically, did the results change? (5 pts)


# (Q3) - Plot the residuals of both models. Do you think either model is a good fit? Why or why not? (3 pts)


# Re-run both models as generalized additive models instead (using gam). Then compare the AIC of both models. (4 points each)
AIC(gam.mod1, gam.mod2)


# (Q4) - Which model is a better fit? (2 pt)


# (Q5) - Based on the residuals of your generalized additive models, how confident are you in these results? (2 pts)


=======
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
#And it is creating a new column.

# (Q2) - Did the interactive effect change which variables predict proportional consumption? How, specifically, did the results change? (5 pts)
summary(dist1)
summary(dist2)
#The carapace width determines more than the claw width at predicting the consumption.There were negative results for claw width.
#True, but how is this related to additive vs interactive effects?

# (Q3) - Plot the residuals of both models. Do you think either model is a good fit? Why or why not? (3 pts)
#gllm.mod1 is the best fit for the model because there is a higher amount of residuals at a lower fitted value.
#Neither is a good fit because of the patterns in the residuals.

# Re-run both models as generalized additive models instead (using gam). Then compare the AIC of both models. (4 points each)
gam.mod1 <- glmmPQL(prop.cons ~ activity.level + carapace.width + claw.width, family = gaussian, random = ~ 1 | block, data = df)
gam.mod2 <- glmmPQL(prop.cons ~ activity.level * carapace.width * claw.width, family = gaussian, random = ~ 1 | block, data = df)
AIC(gam.mod1, gam.mod2)
#This are not gam models. Need to use gam() not glmmPQL() which is the identical model to what you created above.

# (Q4) - Which model is a better fit? (2 pt)
#gam.mod1

# (Q5) - Based on the residuals of your generalized additive models, how confident are you in these results? (2 pts)
#Somewhat confident since I randomly picked two physical changes that could effect the prediction of the consumption.
#This answer is not based on residuals.
>>>>>>> fa4c085086048e9a89da6ea1b502ff089cd148a6






