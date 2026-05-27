##Author: Etornam Godwin Dodor
##Date Created: 5/26/2026
##Date Updated:
##Description: I learned vectorization principles, arithmetic operations on vectors (`+`, `-`, `*`, `/`, `^`, `%%`, `%/%`), vector recycling rules, comparison operations returning logical vectors, combining conditions with `&` and `|`, statistical functions (`sum()`, `mean()`, `median()`, `sd()`, `var()`, `min()`, `max()`, `range()`, `quantile()`), 
#cumulative functions (`cumsum()`, `cumprod()`, `cummin()`, `cummax()`, `diff()`), rounding functions (`round()`, `floor()`, `ceiling()`, `trunc()`, `signif()`), transformations (`sqrt()`, `log()`, `exp()`, `abs()`, `sign()`), sorting and ordering (`sort()`, `order()`, `rank()`, `rev()`), set operations (`union()`, `intersect()`, `setdiff()`, `setequal()`), 
#testing with `any()` and `all()`, handling duplicates with `unique()` and `duplicated()`

rm(list=ls())

##setting the working directory
myPath <- setwd(setwd("C:/Users/edodor/Desktop/base-r-learning-journey/Topic01_Fundamentals"))

##VECTORIZATION
#These are operations that are applied to all the elements of a vector at once without using a loop

#Add 10 to each element of a vector
numbers <- c(3,5,6,7)
numbers + 10

#Multiply each element of a vector by 2
numbers * 2


##ARITHMETIC OPERATION ON VECTORS
vec1 <- c(10, 20, 30, 40, 50)
vec2 <- c(1, 2, 3, 4, 5)

#Addition
vec1 + vec2               #11 22 33 44 55

#Subtraction
vec1 - vec2               #9 18 27 36 45

#Multiplication
vec1 * vec2               #10 40 90 160 250

#Division
vec1 / vec2               #10 10 10 10 10

#Integer division
vec1 %/% vec2             #10 10 10 10 10

#Modulo (remainder)
vec1 %% vec2              #0 0 0 0 0

#Exponentiation
vec2 ^ 2                  #1 4 9 16 25
2 ^ vec2                  #2 4 8 16 32

#Combining operations
(vec1 + vec2) * 2         #22 44 66 88 110
vec1 / 2 + vec2 * 3       #8 13 18 23 28


##OPERATIONS WITH SCALARS
#A scalar is a single value

numbers <- c(5, 10, 15, 20, 25)

#Add scalar
numbers + 100             #105 110 115 120 125

#Multiply by scalar
numbers * 3               #15 30 45 60 75

#Divide by scalar
numbers / 5               #1 2 3 4 5

#Subtract scalar
numbers - 10              #-5 0 5 10 15

#Power with scalar
numbers ^ 2               #25 100 225 400 625
2 ^ numbers               #32 1024 32768 1048576 33554432

#Modulo with scalar
numbers %% 3              #2 1 0 2 1


##VECTORS RECYCLING IN R
#How this works is that When vectors have different lengths, R recycles the shorter one

#Length 5 and length 1
c(1, 2, 3, 4, 5) + 10    #10 is recycled 5 times to produce  11 12 13 14 15

#Length 6 and length 2
c(1, 2, 3, 4, 5, 6) + c(10, 20) #10 is added to 1, 3, 5 and 20 is added to 2, 4, 6
                     
#Length 6 and length 3
c(1, 2, 3, 4, 5, 6) + c(10, 20, 30)

#Length 5 and length 3
c(1, 2, 3, 4, 5) + c(10, 20, 30) #5 is not a multiple of 3, so R gives a warning and produces 11 22 33 14 25


##COMPARISON OPERATIONS
#Comparisons return logical vectors (TRUE/FALSE)
#Since we are working with two vectors, it will compare the elements in the same positions in each vector
vec1 <- c(10, 20, 30, 40, 50)
vec2 <- c(15, 20, 25, 40, 60)

#Equal to
vec1 == vec2             #FALSE TRUE FALSE TRUE FALSE

#Not equal to
vec1 != vec2             #TRUE FALSE TRUE FALSE TRUE

#Greater than
vec1 > vec2              #FALSE FALSE TRUE FALSE FALSE

#Less than
vec1 < vec2              #TRUE FALSE FALSE FALSE TRUE

#Greater than or equal
vec1 >= vec2             #FALSE TRUE TRUE TRUE FALSE

#Less than or equal
vec1 <= vec2             #TRUE TRUE FALSE TRUE TRUE

#Compare with scalar
vec1 > 30                #FALSE FALSE FALSE TRUE TRUE
vec1 == 40               #FALSE FALSE FALSE TRUE FALSE


##LOGICAL OPERATIONS
#Logical operations on logical vectors

logic1 <- c(TRUE, TRUE, FALSE, FALSE)
logic2 <- c(TRUE, FALSE, TRUE, FALSE)

#AND (&)
logic1 & logic2          #TRUE FALSE FALSE FALSE

#OR (|)
logic1 | logic2          #TRUE TRUE TRUE FALSE

#NOT (!)
!logic1                  #FALSE FALSE TRUE TRUE
!logic2                  #FALSE TRUE FALSE TRUE

#XOR (exclusive OR)
xor(logic1, logic2)      #FALSE TRUE TRUE FALSE

#Combining comparisons
numbers <- c(15, 22, 8, 35, 45, 12, 50)

#Numbers between 10 and 40
(numbers >= 10) & (numbers <= 40)    #TRUE TRUE FALSE TRUE FALSE TRUE FALSE

#Numbers less than 10 OR greater than 40
(numbers < 10) | (numbers > 40)      #FALSE FALSE TRUE FALSE TRUE FALSE TRUE

#Numbers NOT equal to 22
!(numbers == 22)         # TRUE FALSE TRUE TRUE TRUE TRUE TRUE


##SOME STATISTICAL FUNCTIONS
data <- c(10, 15, 20, 25, 30, 35, 40)

#Sum
sum(data)                #175

#Product
prod(data)               #525000000

#Mean (average)
mean(data)               #25

#Median
median(data)             #25

#Minimum
min(data)                #10

#Maximum
max(data)                #40

#Range (min and max)
range(data)              #10 40

#Variance
var(data)                #116.6667

#Standard deviation
sd(data)                 #10.80123

#Quantiles
quantile(data)           #0% 25% 50% 75% 100%
quantile(data, c(0.25, 0.75))    #25th and 75th percentiles

#IQR (Interquartile range)
IQR(data)                #15

#Summary statistics
summary(data)            #Min, 1st Qu, Median, Mean, 3rd Qu, Max

#Statistics functions with NA values
dataNa <- c(10, 15, NA, 25, 30, NA, 40)
sum(dataNa)             #NA
sum(dataNa, na.rm = TRUE)    #120 (removes NA)
mean(dataNa, na.rm = TRUE)   #24
max(dataNa, na.rm = TRUE)    #40


##CUMULATIVE FUNCTIONS
numbers <- c(1, 2, 3, 4, 5)

#Cumulative sum
cumsum(numbers)          #1 3 6 10 15

#Cumulative product
cumprod(numbers)         #1 2 6 24 120


#Cumulative minimum
cummin(c(5, 3, 8, 2, 9, 1, 7))    #5 3 3 2 2 1 1

#Cumulative maximum
cummax(c(5, 3, 8, 2, 9, 1, 7))    #5 5 8 8 9 9 9



##DIFFERENCES AND LAGGING
values <- c(10, 15, 18, 20, 25, 32)

#Differences between consecutive elements
diff(values)             #5 3 2 5 7

#Second-order differences
diff(values, lag = 2)    #8 5 7 12

#Differences with larger lag
diff(values, lag = 3)    #10 10 14


##SOME FUNCTIONS FOR ROUNDING OFF VALUES
decimals <- c(3.14159, 2.71828, 1.41421, 9.87654)

#Round to nearest integer
round(decimals)          #3 3 1 10

#Round to n decimal places
round(decimals, 2)       #3.14 2.72 1.41 9.88
round(decimals, 3)       #3.142 2.718 1.414 9.877

#Floor (round down)
floor(decimals)          #3 2 1 9
floor(c(-2.7, -2.3))    #-3 -3 (towards negative infinity)

#Ceiling (round up)
ceiling(decimals)        #4 3 2 10
ceiling(c(-2.7, -2.3))  #-2 -2 (towards positive infinity)

#Truncate (remove decimals, towards zero)
trunc(decimals)          #3 2 1 9
trunc(c(-2.7, -2.3))    #-2 -2 (towards zero)

#Significant figures
signif(decimals, 3)      #3.14 2.72 1.41 9.88


##ABSOLUTE VALUES
numbers <- c(-5, -3, 0, 2, 4, -8, 6)

#Absolute value
abs(numbers)             #5 3 0 2 4 8 6

#Sign of number (-1, 0, or 1)
sign(numbers)            # -1 -1 0 1 1 -1 1



##SORTING AND ORDERING VALUES
values <- c(45, 23, 67, 12, 89, 34)

#Sort (ascending by default)
sort(values)             #12 23 34 45 67 89

#Sort descending
sort(values, decreasing = TRUE)    #89 67 45 34 23 12

#Order (returns indices for sorting)
order(values)            #4 2 6 1 3 5
values[order(values)]    #Same as sort function

#Rank (returns rank of each element)
rank(values)             # 4 2 5 1 6 3

#Reverse
rev(values)              #34 89 12 67 23 45


##SET OPERATIONS
set1 <- c(1, 2, 3, 4, 5)
set2 <- c(4, 5, 6, 7, 8)

#Union(all unique elements)
union(set1, set2)        #1 2 3 4 5 6 7 8

#Intersection (common elements)
intersect(set1, set2)    #4 5

#Set difference (in set1 but not set2)
setdiff(set1, set2)      #1 2 3

#Set difference (in set2 but not set1)
setdiff(set2, set1)       #6 7 8

#Check equality of sets
setequal(set1, set2)     #FALSE
setequal(c(1,2,3), c(3,2,1))    #TRUE(order doesn't matter)

#Is subset?
c(1, 2) %in% set1        #TRUE TRUE
all(c(1, 2) %in% set1)   #TRUE (all elements are in set1)
all(c(1, 9) %in% set1)   #FALSE (9 is not in set1)


##ANY AND ALL AS FUNCTIONS
#any() - TRUE if ANY element is TRUE
#all() - TRUE if ALL elements are TRUE

values <- c(5, 10, 15, 20, 25)

#Any value greater than 20?
any(values > 20)         #TRUE (25 is > 20)

#Any value greater than 30?
any(values > 30)         #FALSE

#All values greater than 0?
all(values > 0)          #TRUE

#All values greater than 10?
all(values > 10)         #FALSE (5 is not > 10)


##MATCHING AND DUPLICATES
fruits <- c("apple", "banana", "cherry", "apple", "date", "banana")

#Find duplicates
duplicated(fruits)       #FALSE FALSE FALSE TRUE FALSE TRUE

#Get unique values
unique(fruits)           #"apple" "banana" "cherry" "date"

#Count occurrences
table(fruits)            #apple:2, banana:2, cherry:1, date:1

#Match positions
match(c("cherry", "apple"), fruits)    #3 1 (first occurrence)

#Which elements match
fruits %in% c("apple", "banana")    #TRUE TRUE FALSE TRUE FALSE TRUE