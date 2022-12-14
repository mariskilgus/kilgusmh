# Load the "anytime" and "ggplot2" packages to complete this week's assignment.


install.packages("anytime")
library(anytime)
install.packages("ggplot2")
library(ggplot2)

0# Read the "Plankton_move_average" CSV in from GitHub. 
setwd("C:/GitHub/kilgusmh/Week7")
data <- read.csv("Plankton_move_average.csv")
# These are data from the Great Lakes Environmental Research Laboratory plankton sampling.


#Used the following lines to format the date and remove NAs from the dataset:
data$Date <- as.Date(data$Date, origin = "0001-01-01") # Setting values to "day zero".
data <- na.omit(data)

#Plot these population data over time with the following code:
ggplot(data)  +
  xlab("Numeric Date") + ylab("Density Individuals")+
  geom_line(data=data, aes(Date, D.mendotae), color="black", alpha = 0.7, size=1)+
  geom_line(data=data, aes(Date, LimncalanusF+LimncalanusM), color="orange",  alpha = 0.7, size=1)+ # adding males and females together, hint: this is actually spelled Limnocalanus
  geom_line(data=data, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  geom_line(data=data, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  theme_bw()


# Export this plot to have on hand for reference in the next section of the assignment (and upload with your script).

# (1) - Which species is most likely to be r-selected prey and which its primary predator? (2 pts)
#Bythotrephes is the r-selected prey and D.mendotae is the primary predator.
# What is one relationship the third species MIGHT have to the first two? (2 pts)
#Limncalanus could be the predator of Bythotrephes and the prey of D.mendotae.
#These relationships are backward. D. mendotae is the prey.


#Now copy/paste in the Lotka-Volterra function, plotting script, and load the "deSolve" package from the tutorial:
install.packages("deSolve")
library(deSolve)

# To create these plots and view in the full window, we need to remove the par() settings for multipanel plots.
# This is done with the dev.off() function
dev.off()

#create the Lotka-Volterra function we will be using with this operation.

LotVmod <- function (Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    dx = x*(alpha - beta*y)
    dy = -y*(gamma - delta*x)
    return(list(c(dx, dy)))
  })
}

# (2) - What do alpha, beta, gamma, and delta represent in this function? (4 pts)
#They are each of the comparatives used to create the graph.
#This is not what they represent - they are coeffecients for estimating predator-prey relationships.

# (3) - By only changing values for alpha, beta, gamma, and/or delta
Pars <- c(alpha = 2, beta = 0.5, gamma = .2, delta = .6) 
#This is the line we will change
State <- c(x = 10, y = 10)
#For now keep this the same.
Time <- seq(0, 100, by = 1)
#For now keep this the same.

out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time)) 

matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Limncalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)

# Increase in alpha:
Pars <- c(alpha = 4, beta = 0.5, gamma = .2, delta = .6)
out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Limncalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)

#Decrease in alpha:
Pars <- c(alpha = 1, beta = 0.5, gamma = .2, delta = .6)
out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Limncalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)

#Increase in beta:
Pars <- c(alpha = 2, beta = 0.7, gamma = .2, delta = .6)
out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Limncalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)

#Decrease in beta:
Pars <- c(alpha = 2, beta = 0.5, gamma = .2, delta = .6)
out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Limncalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)

#Increase in gamma:
Pars <- c(alpha = 2, beta = 0.5, gamma = .3, delta = .6)
out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Limncalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)

#Increase in delta:
Pars <- c(alpha = 2, beta = 0.5, gamma = .2, delta = .7)
out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Limncalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)

# Decrease in delta:
Pars <- c(alpha = 2, beta = 0.5, gamma = .2, delta = .4)
out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Limncalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)

# change the default parameters of the L-V model to best approximate the relationship between Limncalanus and D.mendotae, assuming both plots are on the same time scale.
# What are the changes you've made to alpha, beta, gamma, and delta from the default values; and what do they say in a relative sense about the plankton data? (4 pts)
#A decrease in beta shows that when Limncalanus decreases, D.mendotae decreases as well. They are dependent of each other.
#What are the changes that YOU have made, not the examples from the tutorial.
#The point was to identify your own changes to the coeffecients and generate an entirely new plot.

# Are there other paramenter changes that could have created the same end result? (2 pts)
#A decrease in delta shows the same result.
# Export your final L-V plot with a legend that includes the appropriate genus and/or species name as if the model results were the real plankton data, 
# and upload with your script. (hint - remember which one is the predator and which is the prey)



