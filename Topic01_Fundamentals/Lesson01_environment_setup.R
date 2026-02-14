##Etornam Godwin Dodor
##02/14/2026

##WORKING DIRECTORY
#Checking the current working directory
getwd()

#setting the working directory
myPath <- setwd('C:/Users/edodor/Desktop/BaseR/base-r-learning-journey/Topic01_Fundamentals') #Use backslach
getwd()

#Listing all the files in the current working directory
list.files(myPath)
dir(myPath) ##This also lists the files in the current working directory

#List all the files in the working directory including hidden ones
list.files(myPath, all.files = T)


##WORKSPACE MANAGEMENT
#Creating objects 
studentName <- 'Deh James'
studentAge <- 24
studentGPA <- 4.0
graduationYear <- 2027


#Listing all the objects in the workspace
ls()

#Listing the structure of all the objects in the workspace
ls.str()

#Removing the studentAge variable
rm(studentAge)
ls()

#Removing both studentGPA and studentName
rm(studentGPA, studentName)

#Removing all the objects in the workspace
rm(list=ls())
ls()


##PACKAGE MANAGEMENT
#Checking which packages are currently loaded
search()

#Check where packages are installed
.libPaths()

#Installing packages
install.packages('tidyverse') ##Installing a packing should be done once

#Loading a package
library(tidyverse) #Loading a package can be done during each r session when needed
search()

#Getting help on a package
?tidyverse
help(tidyverse) #This also gets help on a package
