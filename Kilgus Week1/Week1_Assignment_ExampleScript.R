# Creating a data frame to match the structure from your homework assignment last week: ####
#The 5 vectors:
unique.char <- c('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o')
group.char <- c('x','x','x','x','y','y','y','z','z','z','z','z','z','z','z')
uniqu.num <- c(0,1,1,2,3,5,8,13,21,34,55,89,144,233,377)
rep.num <- c(1,2,3,1,2,3,1,2,3,5,2,3,4,0,5)
dec.num <- c(1,2.1,3.1,1.2,2.3,3.5,1.8,2.13,3.21,5.34,2.55,3.89,4.144,0.233,5.377)

# Combine vectors into a data frame:
df <- as.data.frame(cbind(unique.char,group.char,uniqu.num,rep.num,dec.num))
#Make sure the numeric columns stay numeric:
df$uniqu.num <- as.numeric(as.character(df$uniqu.num))
df$rep.num <- as.numeric(as.character(df$rep.num))
df$dec.num <- as.numeric(as.character(df$dec.num))

# Create row to add to the data frame:
add.row <- data.frame("p","z",610,4,4.610)

# Match the names of the columns:
colnames(add.row) <- colnames(df)    

# Bind rows:
df1 <- rbind(df, add.row)

# Now to move the row names and delete the column. 
row.names(df1) <- df1$unique.char
df1 <- df1[,-1]
df1

summary(df1)
#group.char   uniqu.num         rep.num         dec.num     
#x:4        Min.   :  0.00   Min.   :0.000   Min.   :0.233  
#y:3        1st Qu.:  2.75   1st Qu.:1.750   1st Qu.:2.025  
#z:9        Median : 17.00   Median :2.500   Median :2.825  
#Mean   : 99.75   Mean   :2.562   Mean   :2.905  
#3rd Qu.:102.75   3rd Qu.:3.250   3rd Qu.:3.954  
#Max.   :610.00   Max.   :5.000   Max.   :5.377  
> 

