##Author: Etornam Godwin Dodor
##Date Created: 02/28/2026
##Date Last Updated:
##Description:I worked with seq() patterns such as (decimal steps, length.out), rep() patterns (nested, times vector, combining `each` and `times`), combining `seq()` and `rep()`, 
#mathematical sequences (arithmetic), sequence manipulation (`rev()`, `sort()`).


#Clearing the workspace
rm(list=ls())

#Setting the working directory
myPath <- setwd('C:/Users/edodor/Desktop/base-r-learning-journey/Topic01_Fundamentals')


##ADVANCED SEQUENCE PATTERNS
#Sequences with decimals
seq(1,10, by=0.5) #1,1.5,2,2.5,3,.....10
seq(1.5, 3.6, by = 0.02) #1.5,1.52,1.54,...3.6

#Negative sequences
seq(20,5, by=-5) #Decreasing order from 20 to 5
seq(100,0, by=-10) #Decreasing order from 100 to 0
seq(100,-100, by=-20)

#Creating percentages
seq(0,100, by=10) ##since percentage is basically from 0 to 100

#Creating probabilities
seq(0,1,by=0.1) #Since probability is between 0 and 1


##ARITHMETIC OPERATIONS OF SEQUENCES
#Since sequences are vectors, arithmetic operations like +_*^/ can be performed on them
seq(2,10, length=5) * 2 #This multiplies the sequence by 2
seq(3,5, length=10) ^2  #This raises each element of the sequence to the second power
seq(0,20, by=4) / 4     #This divides each element of the sequence by 4

#Generate powers of a number using sequence
3 ^ seq(1,5) #Powers of 3: 3,9,27,81,243
2^ seq(2,10)

#Generating negative numbers
-seq(10,20)
seq(-10, -20)
seq(10,20)*-1

#Generating alternating signs of positive and negative numbers
seq(3,6) * c(1,-1) #3,-4,5,-6
seq(-10,10) #-10,-9,...,10


##ADVANCED REPETITION PATTERNS
#Nested repitition
rep(rep(c(1,3), each=3), times=2) #This repeats each element twice and then repeats the entire thing twice
rep(c(1,3), each=3, times=2) #This does the same thing as the above nested repetition
rep(rep(c(1,3), times=2), each=2) #This repeats the vector twice and then each element twice
rep(rep(c(1,3), each=2), each=2)  #This repeats each element twice and then repeats each element twice

#Using length and table after using rep()
Data <- rep(c('Control Group','Treatment Group'), each=10)
length(Data) #Returns the total number of elements in the Data
table(Data)  #Returns a count of all the unique elements
unique(Data) #Returns all the unique elements in the Data


##COMBINING seq() AND rep()
rep(seq(2,9, by=2), each=3) #repeating each element of a sequence
rep(seq(10,20, by=2), times=3) #repeating the entire sequence 3 times


##CUMSUM
#cumsum()
cumsum(1:10)  #1,3,6,...,55

##REVERSING A SEQUENCE
#use rev()
a <- seq(1,30,5) #1  6 11 16 21 26
rev(a) # 26 21 16 11  6  1


##SORTING SEQUENCES
#use sort()
b <- c(76,4,67,67,9,122,54)
sort(b)  #at default is sorts in ascending order
sort(b, decreasing = T) #sorts in descending order
