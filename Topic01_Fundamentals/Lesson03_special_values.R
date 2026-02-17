##Etornam Godwin Dodor
##02/16/2026


#clearing the workspace
rm(list=ls())

#setting the working directory
getwd()
myPath <- setwd('C:/Users/edodor/Desktop/BaseR/base-r-learning-journey/Topic01_Fundamentals')


##NA: This represents missing values or unknown data
age <- NA
age

##NA can be of different data types
general <- NA #This is general NA which can become any data type but it is logical
naCharacter <- NA_character_ ##This is a character NA
naInteger <- NA_integer_ #This is an integer NA
naComplex <- NA_complex_ #This is a complex NA
naReal <- NA_real_ # This is a real NA

#The class() function is used to check the data type
#Checking the class of the NAs created above
class(general)
class(naCharacter)
class(naInteger)
class(naReal)

#Arithmetic operations with NA returns an NA
5 + NA
20 - NA
8 * NA
7 / NA

#Comparison operations with NA returns an NA
5 > NA
20 <= NA 
NA == NA
NA != NA

#Logical operations with NA 
#NA with 'and'
TRUE & NA #it returns NA
FALSE & NA #returns FALSE because FALSE and anything is FALSE

#NA with 'or' 
TRUE | NA #returns TRUE because TRUE or anything is TRUE
FALSE | NA #returns NA

#Checking for NA values
#is.na() function checks for missing values and returns TRUE or FALSE
is.na(age) #returns true because it is NA
is.na(5)   #returns false because it is not NA

#Checking missing values in a vector
shoeSizes <- c(23,45,43,38,NA,NA,35)
is.na(shoeSizes) 

#counting the number of missing values
#The sum function can be used
sum(is.na(shoeSizes)) #TRUE=1, FALSE=0 so the sum function counts the number of TRUEs

#Finding the position of NAs in a vector
#The which function returns the postion of the specified condition
which(is.na(shoeSizes)) #which of the shoe sizes is missing

#Checking if any value of a vector is missing
#The any() function returns TRUE if a specified condition is met and FALSE otherwise
any(is.na(shoeSizes)) #are any of the shoe sizes missing?

#checking if all the values of a vector are missing
#The all() function returns TRUE if all the specified conditions are met
all(is.na(shoeSizes)) #are all the shoe sizes missing?

#Handling missing values
#subsetting can remove missing values
shoeSizes[!is.na(shoeSizes)] #This returns all the values that are not NA

#na.omit() will completely remove the missing values
completeShoeSizes <- na.omit(shoeSizes)

#complete.cases() can also be used to handle missing values. It checks for values that are not missing 
complete.cases(shoeSizes) 
!complete.cases(shoeSizes) #checks for missing values
completeSizes <- shoeSizes[complete.cases(shoeSizes)] #This removes all the missing values

#Working with a vector that contains missing values
#when a function is applied to a vector that contains NA, it returns NA
mean(shoeSizes) #NA

#To remove the missing values in a function, specify na.rm=TRUE
mean(shoeSizes, na.rm = TRUE)

#Replacing missing values with 0 in a vector
shoeSizes[is.na(shoeSizes)] <- 0
shoeSizes

#Replacing missing values with the mean(This is called imputation)
height <- c(54,43,24,65,NA,84,NA)
meanHeight <- mean(height, na.rm = TRUE)
height[is.na(height)] <- meanHeight #assigning the mean height to the missing values
height


##NULL: this represents the absence of a value or an empty object.
#Note that NA means missing but NULL means it does not exist at all

length(NULL) #0 because it does not exist
length(NA)  #1 because it exists but missing

weight <- c(32,12,45,67,87,NULL,100)
length(weight) #6 instead of 7 because NULL does not exist. It disappears
weight[6] #returns 100 because NULL does not exist

#checking for NULL
#is.null() is used to check for NULL
a <- NULL
is.null(a) #TRUE
is.null(5) #FALSE
is.null(NA) #FALSE because NULL is not NA

#Arithmetic operations with NULL returns basically nothing 
6 + NULL #adding 6 to something that does not exist 
10 - NULL #subtracting something that does not exist from 10

#comparison operations with NULL
6 > NULL #6 can't be compared to something that does not exist
4 <= NULL

#Logical operations with NULL returns basically nothing
TRUE & NULL
FALSE & NULL
TRUE | NULL
FALSE | NULL


##NaN: (Not a Number) this represents mathematical operations that are not possible
0/0 #Zero divided by zero
Inf - Inf #Infinity minus Infinity
Inf/Inf  #Infinity divided by Infinity
0 * Inf  #zero times Infinity
sqrt(-1) #square root of negative one

#The following operations are valid and won't return NaN
Inf + Inf #Inf
1/Inf #zero
1/0 #Inf
-1/0 #-Inf

#checking for NaN
b <- NaN
is.nan(b) #TRUE
is.nan(NA) #FALSE because NA is not NaN
is.na(NaN) #TRUE because NaN is NA hence all NaN are NA but not all NA are NaN

#Arithmetic operations with NaN
4 + NaN #NaN
54-NaN  #NaN


##Inf and -Inf
#Inf is positive infinity
1/0  #Inf
100^500 #Inf

#-Inf is negative infinity
-1/0 #-Inf
-34^789 #-Inf

#Checking for infinity in a vector
#is.infinite() checks if there is an infinite value
d <- c(32,34,Inf,43,890)
is.infinite(d) 
is.finite(d) #This checks for finite value hence it is the opposite of is.infinite()

#Arithmetic operations with Inf
213 + Inf  #Inf
Inf - 434  #Inf
Inf * 2    #Inf

#Comparison Operations with Inf
23 < Inf
Inf >= 585
-Inf <= 3
Inf == Inf 

#Removing Inf values with subsetting
d[is.finite(d)]  
d[!is.infinite(d)]


k <- c(1, 2, NaN, 4, 5)
k[!is.nan(k)]
k[complete.cases(k)]
k[is.finite(k)]
sum(is.nan(k))
