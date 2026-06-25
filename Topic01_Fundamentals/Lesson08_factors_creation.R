##Author: Etornam Godwin Dodor
##Date Created: 06/24/2026
##Date Last Updated:
##Description: I learned what factors are and why we use them for categorical data, creating basic factors with `factor()`, default alphabetical level ordering, specifying custom level orders with the `levels` argument, creating ordered factors with `ordered = TRUE`, comparing ordered factor elements, generating balanced designs with `gl()`, 
#converting to a factor using `as.factor()`, factor properties (`levels()`, `nlevels()`, `table()`, `is.factor()`)



#Clearing the Workspace
rm(list=ls())


#Setting the working directory
setwd("C:/Users/edodor/Desktop/base-r-learning-journey/Topic01_Fundamentals")



##Basic Factor Creation
gender <- factor(c('M','F','M','M','F'))
gender ##R automatically sets the levels to be F,M which is in alphabetical order


#Checking the levels
levels(gender)


#Checking the number of levels
nlevels(gender)


#Checking the underlying integers
as.integer(gender) #Female is 1, Male is 2



##Recoding the Levels Manually 
daysOfTheWeek <- factor(c('Mon','Tue','Wed','Thur','Fri','Sat','Sun'),
                        levels=c('Mon','Tue','Wed','Thur','Fri','Sat','Sun'))
daysOfTheWeek



##Ordered Factors
rateScale <- factor(c('Small','Medium','Small','Large'),
                    levels = c('Small','Medium','Large'),
                    ordered = T)


#Checking if it is ordered
is.ordered(rateScale)
is.ordered(gender)


#Comparing ordered factors
rateScale[1] > rateScale[2]



##Creating Factors with gl()=Generate Levels Function
gl(3,2) #Create a factor of 3 levels and repeat each of them twice


#Adding labels thus names to the various labels
gl(3,4, labels=c('Control','TreatmentA','TreatmentB'))



##Converting to a Factor
#Converting from character to a factor
coloursNorm <- c('Red','Blue','Red','Green')
coloursFac <- as.factor(coloursFav)



##Some Factor Properties
satisfactionLevel <- factor(c("Good", "Poor", "Excellent", "Good", "Average", "Poor", "Good"),
  levels = c("Poor", "Average", "Good", "Excellent"))

shirtSizes <- factor(c("S", "M", "L", "M", "XL", "S", "M", "L"),
                levels = c("S", "M", "L", "XL"))

gender <- factor(c("M", "F", "M", "F", "M", "F"),
                 levels = c("M", "F"))

grade <- factor(c("A", "B", "A", "A", "B", "A"),
                levels = c("A", "B", "C"))

#length
length(satisfactionLevel)


#number of levels
nlevels(satisfactionLevel)


#contingency table
table(satisfactionLevel)


#structure
str(satisfactionLevel)


#attributes
attributes(satisfactionLevel)


#check if it is a factor
is.factor(satisfactionLevel)


#summary
summary(satisfactionLevel)


#proportions
prop.table(table(shirtSizes))


#cross-tabulations
table(gender,grade)