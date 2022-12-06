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
cowgas.xlsx <- read.csv("cowgas.xlsx", header=T)
Cowgas <- read_excel(system.file("extdata",
                                        "cowgas.xlsx",
                                               package = "datplot",
                                               mustWork = TRUE))



# accessing all the sheets
sheet = excel_sheets("cowgas.xlsx")

# applying sheet names to dataframe names
data_frame = lapply(beetlegas.csv, cowgas.xlsx(beetlegas.csv, cowgas.xlsx),
                    function(x) read_excel("beetlegas.csv", "sheet=x"cowgas.xlsx))

# attaching all dataframes together
data_frame = bind_rows(data_frame, .id="Sheet")

# printing data of all sheets
print (data_frame)





plot(beetlegas.csv)
plot(cowgas.xlsx)




ozone <- airquality$Ozone
temp <- airquality$Temp

ozone_norm <- rnorm(200,mean=mean(ozone, na.rm=TRUE), sd=sd(ozone, na.rm=TRUE))
temp_norm <- rnorm(200,mean=mean(temp, na.rm=TRUE), sd=sd(temp, na.rm=TRUE))
boxplot(ozone, ozone_norm, temp, temp_norm,
        main = "Multiple boxplots for comparision",
        at = c(1,2,4,5),
        names = c("antibiotic1", "antibiotic2", "control1", "control2"),
        las = 2,
        col = c("green","red"),
        border = "blue",
        horizontal = TRUE,
        notch = TRUE
)