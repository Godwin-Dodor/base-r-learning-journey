##Author: Etornam Godwin Dodor
##Date Created: 03/06/2026
##Date Updated:
##Description: I learned positive indexing, negative indexing (exclusion), logical indexing with conditions (`&`, `|`), `which()`, `which.min()`, `which.max()`, named indexing, subsetting and replacement, 
##`%in%` operator, `head()`, `tail()`, `unique()`, `duplicated()`, `sample()`

rm(list=ls())

##setting the working directory
myPath <- setwd("C:/Users/edodor/Desktop/base-r-learning-journey/Topic01_Fundamentals")

##BASIC INDEXING (POSITIVE INDEXING)
fruits <- c("apple", "banana", "cherry", "date", "elderberry") #create a vector
fruits[1] #First element
fruits[2] #Second element
fruits[3] #Third element

#using c() to access multiple elements
fruits[c(1,3)] #1st and 3rd elements
fruits[c(2,3,5)] #2nd, 3rd, and 5th elements
fruits[c(1,1,1)] #1st element repeated three times

#access using sequences
fruits[1:3]  #"apple" "banana" "cherry"
fruits[2:5]  #"banana" "cherry" "date" "elderberry"

#access using seq()
fruits[seq(1, 5, by = 2)] #"apple" "cherry" "elderberry" (odd positions)

#out of bounds positions
fruits[20] #NA which means missing


##NEGATIVE INDEXING
#Negative indices excludes the element
#Exclude single element
fruits[-1]  #Everything EXCEPT first: "banana" "cherry" "date" "elderberry"
fruits[-3]  #Everything EXCEPT third: "apple" "banana" "date" "elderberry"
fruits[-5]  #Everything EXCEPT fifth: "apple" "banana" "cherry" "date"

#Exclude multiple elements
fruits[-c(1, 3)]  #Exclude 1st and 3rd: "banana" "date" "elderberry"
fruits[-c(2, 4)]  #Exclude 2nd and 4th: "apple" "cherry" "elderberry"

#Exclude range
fruits[-(1:3)]  #Exclude first three: "date" "elderberry"
fruits[-(4:5)]  #Exclude last two: "apple" "banana" "cherry"


##LOGICAL INDEXING (CONDITIONAL SELECTION)
#Logical indexing uses TRUE/FALSE to select elements
#TRUE = include, FALSE = exclude

#Create a logical vector
selection <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
fruits[selection]  #"apple" "cherry" "elderberry" (positions 1, 3, 5)

#Using logical expressions
numbers <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)

#Select values greater than 50
numbers > 50             #FALSE FALSE FALSE FALSE FALSE TRUE TRUE TRUE TRUE TRUE
numbers[numbers > 50]    #60 70 80 90 100

#Select values less than or equal to 30
numbers[numbers <= 30]   #10 20 30

#Select values equal to 50
numbers[numbers == 50]   #50

#Select values not equal to 50
numbers[numbers != 50]   #10 20 30 40 60 70 80 90 100

#Combining conditions with & (AND)
numbers[numbers > 20 & numbers < 80]    #30 40 50 60 70

#Combining conditions with | (OR)
numbers[numbers < 30 | numbers > 80]    #10 20 90 100

#More examples with characters
fruits <- c("apple", "banana", "cherry", "date", "elderberry")

#Select fruits with "e" in the name
fruits[grepl("e", fruits)]    #"apple" "cherry" "date" "elderberry"

#Select fruits with exactly 5 letters
fruits[nchar(fruits) == 5]    #"apple" "cherry"

#Select fruits starting with "a" to "d"
fruits[fruits >= "a" & fruits <= "e"]    #"apple" "banana" "cherry" "date"


##WHICH()
#which() returns the POSITIONS where condition is TRUE

numbers <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)

# Find positions of values > 50
which(numbers > 50)      #6 7 8 9 10 (positions, not values!)

#Use those positions to get values
positions <- which(numbers > 50)
numbers[positions]       #60 70 80 90 100 (same as numbers[numbers > 50])

#Find position of specific value
which(numbers == 50)     #5
which(numbers == 75)     #integer(0) (not found)

#Find positions of values between 30 and 70
which(numbers >= 30 & numbers <= 70)    #3 4 5 6 7

#which.min() and which.max() - find position of min/max
which.min(numbers)       #1 (position of minimum)
which.max(numbers)       #10 (position of maximum)

#Get the actual min/max values
numbers[which.min(numbers)]    #10
numbers[which.max(numbers)]    #100

#Using which() with characters
fruits <- c("apple", "banana", "cherry", "date", "elderberry")
which(fruits == "cherry")      #3
which(nchar(fruits) > 5)       #2 5 ("banana" and "elderberry")


##NAMED INDEXING
#Access elements by name (if vector has names)

# Create named vector
ages <- c(Alice = 25, Bob = 30, Charlie = 35, Diana = 28, Eve = 32)
ages

#Access by name
ages["Alice"]            #25
ages["Charlie"]          #35

#Access multiple by name
ages[c("Alice", "Eve")]  # 25 32

#Access all except specific names (use negative with position)
#First find position
which(names(ages) == "Bob")    #2
ages[-2]                       #All except Bob

#Or use setdiff
keep_names <- setdiff(names(ages), "Bob")
ages[keep_names]

#Names don't have to be in order
ages[c("Eve", "Alice", "Bob")]    #32 25 30

#Repeat names
ages[c("Alice", "Alice", "Diana")]    #25 25 28

#Non-existent names return NA
ages["Frank"] #NA (doesn't exist)


##SUBSETTING AND REPLACEMENT
#You can use indexing to CHANGE values

#Create vector
numbers <- c(10, 20, 30, 40, 50)

#Replace single element
numbers[3] <- 99
numbers                  #10 20 99 40 50

#Replace multiple elements
numbers[c(1, 5)] <- c(11, 55)
numbers                  #11 20 99 40 55

#Replace with single value (recycling)
numbers[c(2, 4)] <- 100
numbers                  #11 100 99 100 55

#Replace using logical indexing
numbers <- c(10, 20, 30, 40, 50)
numbers[numbers < 30] <- 0
numbers                  #0 0 30 40 50

#Replace using which()
numbers <- c(10, 20, 30, 40, 50)
positions <- which(numbers > 30)
numbers[positions] <- 999
numbers                  #10 20 30 999 999

#Add elements beyond current length (extends vector)
numbers <- c(10, 20, 30)
numbers[5] <- 50
numbers                  #10 20 30 NA 50 (position 4 becomes NA)

#Named vector replacement
ages <- c(Alice = 25, Bob = 30, Charlie = 35)
ages["Bob"] <- 31
ages                     #Alice: 25, Bob: 31, Charlie: 35



#ADVANCED LOGICAL INDEXING
# Complex conditions

numbers <- c(15, 22, 8, 45, 33, 12, 50, 38, 5, 42)

#Values between 10 and 40
numbers[numbers >= 10 & numbers <= 40]    #15 22 33 12 38

#Values NOT between 10 and 40
numbers[numbers < 10 | numbers > 40]      #8 45 50 5 42

#Even numbers (divisible by 2)
numbers[numbers %% 2 == 0]                #22 8 12 50 38 42

#Odd numbers
numbers[numbers %% 2 == 1]                #15 45 33 5

#Values divisible by 3 OR 5
numbers[numbers %% 3 == 0 | numbers %% 5 == 0]    #15 45 33 12 50 5

#Values greater than mean
numbers[numbers > mean(numbers)]          #45 33 50 38 42

#Top 3 values (using order)
top3Positions <- order(numbers, decreasing = TRUE)[1:3]
numbers[top3Positions]                  #50 45 42

#Bottom 3 values
bottom3Positions <- order(numbers)[1:3]
numbers[bottom3Positions]       #5 8 12



##EXTRACTING WITH %in%
#%in% checks if elements are in a set

fruits <- c("apple", "banana", "cherry", "date", "elderberry", 
            "fig", "grape", "honeydew")

#Select fruits that are in a specific list
myFavorites <- c("apple", "cherry", "grape")
fruits[fruits %in% myFavorites]    #"apple" "cherry" "grape"

#Opposite: fruits NOT in favorites
fruits[!(fruits %in% myFavorites)]    #"banana" "date" "elderberry" "fig" "honeydew"



#SUBSET() FUNCTION
#subset() is an alternative to logical indexing
numbers <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)

#Using [ ] to subset
numbers[numbers > 50]

#Using subset()
subset(numbers, numbers > 50)    #Same result



##HEAD() AND TAIL()
#head() - first n elements
#tail() - last n elements

numbers <- 1:100

#First 6 elements (default)
head(numbers)            #1 2 3 4 5 6

#First 5 elements
head(numbers, 5)         #1 2 3 4 5

#Last 6 elements (default)
tail(numbers)            #95 96 97 98 99 100

#Last 5 elements
tail(numbers, 5)         #96 97 98 99 100

#First 20 elements
head(numbers, 20)

#Negative n: all EXCEPT last n
head(numbers, -5)        #All except last 5
tail(numbers, -5)        #All except first 5



##UNIQUE() AND DUPLICATED()
#Handle duplicate values

numbers <- c(10, 20, 30, 20, 40, 10, 50, 30, 20)

#unique() - get unique values
unique(numbers)          #10 20 30 40 50

#duplicated() - which elements are duplicates?
duplicated(numbers)      #FALSE FALSE FALSE TRUE FALSE TRUE FALSE TRUE TRUE

#Get only duplicated values
numbers[duplicated(numbers)]    #20 10 30 20

#Get only unique values (first occurrence)
numbers[!duplicated(numbers)]   #10 20 30 40 50

#Count occurrences
table(numbers)           # Shows count of each value

#Find which values appear more than once
counts <- table(numbers)
counts[counts > 1]       #10:2, 20:3, 30:2



##SAMPLE() - RANDOM SAMPLING
#sample() randomly selects elements
numbers <- 1:100

#Sample 10 random elements (without replacement)
set.seed(123)            #For reproducibility
sample(numbers, 10)

#Sample 20 random elements
sample(numbers, 20)

#Sample WITH replacement (can repeat)
sample(numbers, 10, replace = TRUE)

#Sample entire vector (shuffle)
sample(numbers)          #All 100 numbers in random order

#Sample from smaller vector
fruits <- c("apple", "banana", "cherry", "date", "elderberry")
sample(fruits, 3)        #3 random fruits

#Random TRUE/FALSE
sample(c(TRUE, FALSE), 10, replace = TRUE)
