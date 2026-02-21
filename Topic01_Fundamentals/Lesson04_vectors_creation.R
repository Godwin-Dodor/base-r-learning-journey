##Author: Etornam Godwin Dodor
##Date Created: 02/21/2026
##Date Last Updated:
#Description: In this lesson, I learned creating vectors with c(), type coercion hierarchy, vector(), numeric(), character(), 
#logical(), complex(), sequences with the colon operator : and seq(), seq_len(), seq_along(), repetitions with rep() (times, each, length.out), named vectors


#clearing the workspace
rm(list=ls())


#setting the working directory
myPath <- setwd('C:/Users/edodor/Desktop/BaseR/base-r-learning-journey/Topic01_Fundamentals')


##VECTOR: a vector is the most basic data structure in r. It is a one dimensional collection of elements of the same type
#Creating vectors with c() which stands for concatenate or combine
age <- c(21,24,54,64,76) #Numeric vector
fruits <- c('apple','orange','banana','grape','tangerine') #Character vector
tOrF <- c(T,F,T,T,F) # Logical vector
shoeSize <- c(1L,2L,5L,6L,7L) #Integer vector

#class() is used to check the type of a data structure
class(age) #Numeric


##TYPE COERCION IN R
#Since a vector should contain elements of the same data type, when elements of different data types are mixed in a vector, R automatically converts or coerces.
#The order of the type coercion: character > complex > numeric > integer > logical. This is in decreasing order of being powerful
#Numeric + Logical = all become numeric
mixed1 <- c(1, 2, TRUE, FALSE, 3)
class(mixed1) 

#Character + Numeric = all become character
mixed2 <- c(1, 2, "three", 4)
class(mixed2)

#Character + Logical = all become character
mixed3 <- c(TRUE, FALSE, "yes", "no")
class(mixed3)


##CREATING VECTORS USING vector()
#vector() creates vector of a specific type and length
v1 <- vector(mode = 'numeric', length = 5) #numeric vector of length 5, filled with zeros
v2 <- vector(mode = 'character', length = 5) #character vector of length 5, filled with ""
v3 <- vector(mode = 'logical', length = 3)  #logical vector of length 3, filled with FALSE

#The vector() is useful for filling vectors after declaring it
v1[1] <- 34
v1


##OTHER FORMS OF CREATING VECTORS OF A SPECIFIC TYPE AND LENGTH
#numeric(): creates a numeric vector of zeros
numVec <- numeric(5)
numVec

#logical(): creates a logical vector filled with FALSE
logVec <- logical(5)
logVec

#character(): creates an empty character vector 
chaVec <- character(0)
chaVec

#integer(): creates an integer vector filled with zeros
intVec <- integer(5)
intVec

#complex(): creates a complex vector
comVec <- complex(5)
comVec


##CREATING SEQUENCES WITH THE COLON OPERATOR (:) AND STORING IT AS A VECTOR
colVec <- 1:5 #Ascending order
colVec

salaryVec <- 1030:1020 #Descending order
salaryVec

#The colon operator (:) has a high precedence
1:3-1 #is not the same as 
1:(3-1)


##CREATING SEQUENCES WITH seq()
#specifying the incremental or decreasing step
seq(from=10, to=20, by=2) #Ascending order from 10 to 20 with an incremental step of 2
seq(from=20, to=0, by=-2) #Descending order from 20 to 0 with a decreasing step of 2
seq(1,10,2) #odd numbers
seq(1,3,0.5)

#specifying the number of elements
seq(1,10,length=20) #20 numbers from 1 to 10
seq(1,10,length.out=20) #does the same thing


##CREATING SEQUENCES USING seq_len()
#This creates a sequence from 1 to n
seq_len(5) #1 to 5
seq_len(10) #1 to 10

#CREATING SEQUENCES USING seq_along()
#this is used to create a sequence along a vector and it is very helpful in loops
age <- c(21,24,54,64,76)
seq_along(age) #1 to 5
seq(age) #Also does the same thing as seq_along()


##CREATING REPETITIONS USING rep()
#This is used to repeat values
rep(x = 10, times=4) #repeats 10 four times
rep('Etornam',3)

#Repeating vectors
rep(c(1,3),4)
rep(c('a','b','c'), 3)

#Repeating each element of a vector the same number of times
rep(c(4,5,6), each=2) #repeats each element twice

#Repeating each element of a vector different number of times
rep(c(12,43,54), times=c(2,4,5))

#Combining times with each
rep(c(6,7), each=4, times=3) #this repeats each element of the vector 4 times and repeats everything 3 times


##NAMED VECTORS
height <- 20:25
names(height) <- LETTERS[1:6]
names(height)


##COMBINING VECTORS INTO A SINGLE VECTOR USING c()
combinedVector <- c(age,fruits) 
combinedVector #this becomes a character due to the hierarchy of type conversion


##OTHER PROPERTIES OF VECTORS
#length()
length(age) #This returns the total number of elements

#Type/Class
typeof(age) #typeof() returns how r internally stores an object type
class(age)  #class() returns the object type from the user's perspective

#str()
str(age) #str() is used to check the structure
str(height)

#attributes()
attributes(height) #attributes() returns names, dimemsion, etc

#which()
which(age>3) #This returns the position of all the ages that are greater than 3
age[which(age>3)] #This retrieves all the ages that are greater than 3

#which.max()
which.max(age) #This returns the position of the maximum age
age[which.max(age)] #Retrieves the maximum age

#which.min()
which.min(age) #this returns the position of the minimum age
age[which.min(age)] #This retrieves the minimum age

names(which.max(height)) #This retrieves the name of the person with the maximum height.