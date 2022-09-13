# With the data frame you created last week you will:

# Create a barplot for one numeric column, grouped by the character vector with 3 unique values
unique.char <- c('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o')
group.char <- c('s','s','s','s','s','s','r','r','r','r','t','t','t','t','t')
uniqu.num <- c(0,1,1,4,5,10,11,14,45,55,65,75,92,232)
rep.num <- c(1,1,2,2,2,3,2,2,7,7,2,3,4,0,5)
dec.num <- c(1.1,2.1,2.2,2.3,3.1,2.1,2.5,3.2,4.2,5.3,6.6,7.7,7.9,7.2)

df <- as.data.frame(cbind(unique.char,group.char,uniqu.num,rep.num,dec.num))


df$uniqu.num <- as.numeric(as.character(df$uniqu.num))
df$rep.num <- as.numeric(as.character(df$rep.num))
df$dec.num <- as.numeric(as.character(df$dec.num))

add.row <- data.frame("u","y",77,7.23,9)

colnames(add.row) <- colnames(df)    

df1 <- rbind(df, add.row)

row.names(df1) <- df1$unique.char
df1 <- df1[,-1]
df1

hist(df1$dec.num)
hist(df1$dec.num, breaks = 3)
hist(df1$dec.num, breaks = 8)

boxplot(df1)
boxplot(df1[,2:4])
boxplot(df1[,3:4])
boxplot(df1$uniqu.num)
hist(df1$uniqu.num)
df.mean <- aggregate(df1$rep.num ~df1$group.char, FUN = "mean")
df.mean
colnames(df.mean) <- c("Factor","Mean")
df.mean

  # Add error bars with mean and standard deviation to the plot
barplot(df.mean$Mean)
barplot(df.mean$Mean, names.arg = df.mean$Factor)
df.sd <- aggregate(df1$rep.num ~df1$group.char, FUN = "sd")
colnames(df.sd) <- c("Factor","StanDev")
df.sd
b.plot <- barplot(df.mean$Mean, names.arg = df.mean$Factor)
arrows(b.plot, df.mean$Mean-df.sd$StanDev,
       b.plot, df.mean$Mean+df.sd$StanDev,angle=90,code=3)
b.plot <- barplot(df.mean$Mean, names.arg = df.mean$Factor, ylim = c(0,5))

arrows(b.plot, df.mean$Mean-df.sd$StanDev,
       b.plot, df.mean$Mean+df.sd$StanDev,angle=90,code=3)
barplot(df.mean$Mean, names.arg = df.mean$Factor, ylim = c(0,5), horiz = TRUE)
plot(df1$dec.num ~ df1$rep.num)
plot(df1$dec.num ~ df1$uniqu.num)
  # Change the x and y labels and add a title
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response")
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot")
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot", cex.axis=0.8)
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot", cex.axis=0.8, cex.main = 0.5)
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot", cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25)
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot", 
     cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25, pch=19)
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot", 
     cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25, pch=17)
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot", 
     cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25, pch=17, col = "grey40")
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot", 
     cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25, pch=17, col = "grey40", cex = 1.5)
par(family = "mono")
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot", 
     cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25, pch=17, col = "grey40", cex = 1.5)
par(family = "serif")
#Then replot
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot", 
     cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25, pch=17, col = "grey40", cex = 1.5)


  # Export the plot as a PDF that is 4 inches wide and 7 inches tall.

# Create a scatter plot between two of your numeric columns.
  # Change the point shape and color to something NOT used in the example.
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Days", ylab = "Rainfall", main = "Rainfall In Gatlinburg, TN", pch=15)
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Days", ylab = "Rainfall", main = "Rainfall In Gatlinburg, TN", pch=15, col = "blue")

  # Change the x and y labels and add a title
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Days", ylab = "Rainfall")
> plot(df1$dec.num ~ df1$uniqu.num, xlab = "Days", ylab = "Rainfall", main = "Rainfall In Gatlinburg, TN")

  # Export the plot as a JPEG by using the "Export" button in the plotting pane.

# Upload both plots with the script used to create them to GitHub.
  # Follow the same file naming format as last week for the script.
  # Name plots as Lastname_barplot or Lastname_scatterplot. Save them to your "plots" folder.
