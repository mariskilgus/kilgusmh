# Now it is time to create your own data frame using the tools we have learned this week.
# First, resave this script as: your last name_Week1_Assignment
  # e.g. mine would be Wilson_Week1_Assignemnt #Forgot about this.


# Create 3 numeric vectors and 2 character vectors that are each 15 values in length with the following structures:
  # One character vector with all unique values
  # One character vector with exactly 3 unique values
  # One numeric vector with all unique values
  # One numeric vector with some repeated values (number of your choosing)
  # One numeric vector with some decimal values (of your choosing)
unique.char <- c('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o')
group.char <- c('s','s','s','s','s','s','r','r','r','r','t','t','t','t','t')
uniqu.num <- c(0,1,1,4,5,10,11,14,45,55,65,75,92,232)
rep.num <- c(1,1,2,2,2,3,2,2,7,7,2,3,4,0,5)
dec.num <- c(1.1,2.1,2.2,2.3,3.1,2.1,2.5,3.2,4.2,5.3,6.6,7.7,7.9,7.2)

# Bind the vectors into a single data frame, rename the columns, and make the character vector with unique values the row names.
df <- as.data.frame(cbind(unique.char,group.char,uniqu.num,rep.num,dec.num))

# Remove the character vector with unique values from the data frame.
df$uniqu.num <- as.numeric(as.character(df$uniqu.num))
df$rep.num <- as.numeric(as.character(df$rep.num))
df$dec.num <- as.numeric(as.character(df$dec.num))

# Add 1 row with unique numeric values to the data frame.
add.row <- data.frame("u","y",77,7.23,9)
colnames(add.row) <- colnames(df)    

df1 <- rbind(df, add.row)

row.names(df1) <- df1$unique.char
df1 <- df1[,-1]
df1

# Export the data frame as a .csv file 
#Where is your code to export the CSV? DId not set the working directory or export the CSV.

# Generate summary statistics of your data frame and copy them as text into your script under a new section heading.
#See the red "X" next to each of these? That means R reads it as a function rather than a comment/text like it is intended. Each line needs a hashtag in front of it.
group.char          uniqu.num         rep.num         dec.num     
Length:16          Min.   :  0.00   Min.   :0.000   Min.   :1.100  
Class :character   1st Qu.:  3.25   1st Qu.:2.000   1st Qu.:2.175  
Mode  :character   Median : 12.50   Median :2.000   Median :3.150  
Mean   : 42.94   Mean   :3.139   Mean   :4.225  
3rd Qu.: 67.50   3rd Qu.:4.250   3rd Qu.:6.750  
Max.   :232.00   Max.   :7.230   Max.   :9.000  
> 
# Push your script and your .csv file to GitHub in a new "Week1" folder.


